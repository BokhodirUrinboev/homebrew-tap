# Homebrew tap for Desk Arcade

[Desk Arcade](https://github.com/BokhodirUrinboev/DeskArcade) puts mini-games on top of your desktop in a
transparent overlay: hoops, archery, mini golf, air hockey, chess, durak, a desktop pet and more.

```bash
brew install --cask bokhodirurinboev/tap/deskarcade
```

Upgrade with `brew upgrade --cask deskarcade`, remove with `brew uninstall --cask deskarcade`
(add `--zap` to delete its settings too).

The app is ad-hoc signed and not notarized. If macOS refuses to open it, right-click it in Applications
and choose **Open**, or run `xattr -dr com.apple.quarantine /Applications/DeskArcade.app`.

macOS support is experimental: see the
[main README](https://github.com/BokhodirUrinboev/DeskArcade#macos-14-experimental).

The cask is stamped from
[`packaging/homebrew/deskarcade.rb`](https://github.com/BokhodirUrinboev/DeskArcade/blob/main/packaging/homebrew/deskarcade.rb)
for each release.
