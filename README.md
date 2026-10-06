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

The PopCraft release compiles the CLI with bun for macOS and Linux (arm64 and x64), attaches the binaries to a
`v<version>` release here, and dispatches `release` with `{ version }`. `Update formulas` downloads them, computes
their SHA256 and regenerates `Formula/popcraft.rb`. Run it by hand from Actions with a version to regenerate.
npm publishes the same CLI separately, as `@popcraft/cli`.
