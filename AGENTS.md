# AGENTS.md

## What this is

Project Arwing: a single-page Elm app (0.19.1, `mdgriffith/elm-ui`) that shows
Super Smash Bros. Melee kill percents for a given stage + character + move,
so a Fox main can glance at it between sets/games. No backend — state is a
`Maybe Stage` / `Maybe Character` selection persisted to `localStorage` via
a port.

- `src/Main.elm` — model/update/view, the stage/character/kill-% screens.
- `src/Types.elm` — `Stage`/`Character` enums + JSON encode/decode.
- `src/Resources.elm` — maps a `Stage`/`Character` to its icon path under `rsrc/`.
- `src/Percents.elm` — the actual kill-percent data (hand-entered from
  spreadsheets/YouTube timestamps, see README acknowledgements).
- `rsrc/` — character/stage icon images checked into the repo.

## Build & dev

- `npm run elm:live` — dev server with hot reload at `localhost:8000`,
  serving the root `index.html` (has the viewport meta tag + port wiring
  elm-live needs; don't delete it or dev mode reverts to the old
  "renders tiny on mobile" bug).
  - **Gotcha**: the script passes `--output=elm.js` deliberately. Without
    it, elm-live inlines the compiled JS straight into `index.html` and
    rewrites that file on disk on every build — silently clobbering the
    viewport meta tag/port wiring and reintroducing the mobile bug. If
    `git status` ever shows `index.html` as modified after running
    `elm:live`, this is why; `git checkout -- index.html` restores it.
- `npm run build` (`build.js`) — compiles Elm with `--optimize` and stitches
  it into `dist/index.html` from `index-template.html` (self-contained,
  inlined JS, localStorage wired via `Elm.Main.init` + `setStorage` port
  subscribe). This is the file that actually gets deployed.
  - **Gotcha**: `build.js` splits on the `__ELM_JS__` placeholder instead of
    using `String.replace(placeholder, elmJs)` — the compiled Elm output is
    full of `$`-prefixed identifiers, and `String.replace`'s special
    `$&`/`$1`-style replacement-pattern handling silently corrupts it if you
    go back to a naive `.replace()` call.

## Running elm-live / dev servers as an agent

`npm run elm:live` and any throwaway `python3 -m http.server` you spin up for
screenshot testing are background processes you are responsible for reaping.
Concretely:

- Track the actual PID. Prefer starting it via the harness's own
  run-in-background mechanism (so it's tracked and stoppable) over
  `(cmd &)` in a raw shell — a backgrounded subshell detaches and
  `pkill -f elm-live` is not reliable against it (this has already bitten
  us: a stray `elm-live` from an earlier test was still running an hour
  later).
- Before ending a session/task, check for stragglers instead of assuming
  your `kill`/`pkill` worked:
  `ps aux | grep -iE "elm-live|elm make|http\.server" | grep -v grep`
- **Never `kill -9` a PID from `lsof -ti:<port>` without first running
  `ps -p <pid> -o pid,ppid,command` to see what it actually is.** `lsof
  -ti:PORT` matches any process with an fd touching that port, including a
  browser's network-service helper process that merely had a connection
  open to your local dev server (e.g. from screenshot-testing via
  claude-in-chrome) — not just the server itself. We've already killed a
  Brave Browser Helper this way by trusting the port number blindly; it
  self-healed, but don't rely on that. Match on the actual command
  (`elm-live`, `python3 -m http.server`) before killing.

## Deployment (currently manual, no CI)

The live site is `https://ivanthetricourne.github.io/project-arwing/index.html`,
served from the **`main`** branch (not `master`) of the separate
`IvantheTricourne/IvantheTricourne.github.io` repo, under the
`project-arwing/` path — cloned locally at
`~/Code/IvantheTricourne.github.io` (checked out to `main`, remote switched
to HTTPS since SSH push wasn't set up in this environment). To deploy:
`npm run build` here, then copy `dist/index.html` and `dist/rsrc/` into that
repo's `project-arwing/` directory, commit, and push.

## Current branch: `mobile-responsive-ui`

Primary feature: a quick stage-switcher dropdown on the kill-percents
screen. Tapping the stage name (now with a ▼/▲ indicator) toggles a
`wrappedRow` of all six stage icons right there; picking one swaps the
stage while keeping the current character selected, so you can flip
through stages for the same character (the actual "glance between
games/sets" workflow) without Back -> Back -> reselect character.

Alongside that, this branch fixes the mobile rendering complaints (screenshots showed the
page rendering at a fixed tiny size with huge empty space, icons too small,
bad navigation between stage/character selection):

1. **Root cause of "always renders the same static size" on phones**: the
   deployed `index.html` had no `<meta name="viewport">` tag at all, so
   mobile browsers rendered it at desktop width and zoomed out. Fixed in
   `index-template.html` / `index.html`.
2. Character icons are natively 24x24px and were only ever CSS-`scale`d
   (a transform, not a real resize) — now explicitly sized via elm-ui
   `width`/`height` (52px characters, 120x105 stages).
3. Fixed per-row `row`s that could overflow on narrow screens are now
   `wrappedRow`s that reflow to the viewport.
4. Content is `alignTop` instead of `centerY` — centering in a tall phone
   viewport left ~half the screen black above/below the card.
5. Added a real `Back` button (steps back one screen: kill%s → character
   select → stage select) distinct from `Reset` (clears both selections).
   Previously the only way back was tapping a tiny unlabeled stage
   thumbnail that acted as a hidden reset button.
6. The `setStorage` port and `encode`/`decoder` in `Main.elm` existed but
   were never wired up in the previously-deployed `index.html` — selection
   persistence across reloads never actually worked in production. Now
   wired via `flags`/`app.ports.setStorage.subscribe` in both `index.html`
   and `index-template.html`.

Not yet pushed to `origin` as of this writing — no working GitHub auth in
the environment that did this work (see git log / ask the user before
assuming it's up to date on the remote).
