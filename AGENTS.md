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

## Testing & CI

- `npm test` (alias `npm run elm:test`) runs the `elm-test` suite under
  `tests/` — `TypesTest.elm` (encode/decode round-trips, `characterToInt`
  injectivity), `PercentsTest.elm` (kill-% data sanity checks), `MainTest.elm`
  (`update` semantics, `Model` persistence round-trips, stage-switcher
  dropdown filtering).
- `.github/workflows/ci.yml` runs that suite on every PR and on push to
  `master`.

## Contribution workflow

Always work on a feature branch and open a PR against `master` — never
commit or push directly to `master`. Use `gh pr create` if the `gh` CLI is
available; otherwise push the branch (`git push -u origin <branch>`) and
hand the user the compare URL GitHub prints, since `gh` may not be
installed in every environment this repo is worked in from.
