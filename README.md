# homebrew-popcraft

Homebrew tap for **PopCraft**: the `popcraft` command line.

## Tap

Homebrew maps `brew tap getpopcraft/popcraft` to this repository
(`https://github.com/getpopcraft/homebrew-popcraft`).

```bash
brew tap getpopcraft/popcraft
brew install popcraft
```

Or in one step: `brew install getpopcraft/popcraft/popcraft`.

## What this tap installs

| Formula | What | Source |
|---|---|---|
| `popcraft` | The PopCraft CLI: edit `.popcraft` files headlessly, call the REST API, publish to the marketplace | [`@popcraft/cli`](https://www.npmjs.com/package/@popcraft/cli) |

## Releases

The PopCraft release dispatches `release` with `{ version }` to this repo after npm publishes the CLI;
`Update formulas` downloads the tarball, computes its SHA256 and commits. Run it by hand from Actions with a
version to re-bump. Homebrew only installs npm packages a day old, so a new version installs about 24 hours
after its release.
