# adios-404/tap

Homebrew tap for [tracklaude](https://github.com/adios-404/tracklaude).

```sh
brew install adios-404/tap/tracklaude
```

The first launch of each version is interrupted twice, by design: macOS blocks the app
until you approve it (it is ad-hoc signed, not notarized), and the Keychain asks for your
login password twice. The install's caveats say how; tracklaude's
[README › Install](https://github.com/adios-404/tracklaude#install) says why.

The cask is bumped by tracklaude's release workflow: each tagged release opens a pull
request here with the new version and the SHA-256 of the Release zip. Merging it is what
publishes the update to `brew upgrade`.
