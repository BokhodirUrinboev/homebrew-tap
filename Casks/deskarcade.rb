# Homebrew cask for Desk Arcade, stamped for a release by packaging/Update-PackageManifests.ps1.
# Published in the tap https://github.com/BokhodirUrinboev/homebrew-tap (Casks/deskarcade.rb): see docs/RELEASING.md.
cask "deskarcade" do
  arch arm: "arm64", intel: "x64"

  version "1.8.6"
  sha256 arm:   "44086c35589e47c3f3a9817e0cdfa995c48f1634b646e223b0f8467e3e661536",
         intel: "62984cfef18a0a4cf031179b085bb30ab5c1c62c43fe0cda23e02e7194c74b16"

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
