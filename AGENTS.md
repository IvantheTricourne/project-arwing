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
- `npm run build` (`build.js`) — compiles Elm with `--optimize` and stitches
  it into `dist/index.html` from `index-template.html` (self-contained,
  inlined JS, localStorage wired via `Elm.Main.init` + `setStorage` port
  subscribe). This is the file that actually gets deployed.
  - **Gotcha**: `build.js` splits on the `__ELM_JS__` placeholder instead of
    using `String.replace(placeholder, elmJs)` — the compiled Elm output is
    full of `$`-prefixed identifiers, and `String.replace`'s special
    `$&`/`$1`-style replacement-pattern handling silently corrupts it if you
    go back to a naive `.replace()` call.

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

This branch fixes the mobile rendering complaints (screenshots showed the
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
