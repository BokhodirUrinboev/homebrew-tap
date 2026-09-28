# Homebrew cask for Desk Arcade, stamped for a release by packaging/Update-PackageManifests.ps1.
# Published in the tap https://github.com/BokhodirUrinboev/homebrew-tap (Casks/deskarcade.rb): see docs/RELEASING.md.
cask "deskarcade" do
  arch arm: "arm64", intel: "x64"

  version "1.8.3"
  sha256 arm:   "5cda150a4d0120481c61adcb7aee409ba0adbb0dee6523e940d37dcd952466c3",
         intel: "b6570587fa4915eaa3599e1653ca48e363ba4267d6f000f14dc8eaa7ea6b39b2"

  url "https://github.com/BokhodirUrinboev/DeskArcade/releases/download/v#{version}/DeskArcade-#{version}-macos-#{arch}.zip"
  name "Desk Arcade"
  desc "Mini-games that play on top of your desktop in a transparent overlay"
  homepage "https://github.com/BokhodirUrinboev/DeskArcade"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "DeskArcade.app"

  uninstall launchctl: "com.imperiumgames.deskarcade",
            quit:      "com.imperiumgames.deskarcade"

  caveats <<~EOS
    Desk Arcade is ad-hoc signed and not notarized. If macOS refuses to open it, right-click the app
    in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine /Applications/DeskArcade.app
  EOS

  zap trash: [
    "~/.config/DeskArcade",
    "~/Library/LaunchAgents/com.imperiumgames.deskarcade.plist",
  ]
end
