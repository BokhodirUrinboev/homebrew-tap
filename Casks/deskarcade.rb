# Homebrew cask for Desk Arcade, stamped for a release by packaging/Update-PackageManifests.ps1.
# Published in the tap https://github.com/BokhodirUrinboev/homebrew-tap (Casks/deskarcade.rb): see docs/RELEASING.md.
cask "deskarcade" do
  arch arm: "arm64", intel: "x64"

  version "1.8.5"
  sha256 arm:   "1fa6c35ff53491ff43cec7e315e3e01ae1b6f5dc3fbb9a812a01f03b78b663d4",
         intel: "b5f608d9ba8cc2774c5aabd412273da7e47cb196094bc3bdb09379262db8f707"

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
