cask "cablehop" do
  version "2.7"
  sha256 "e40a3ec695629b2032d279454a74c9845c4562f8cd3e116627bd118109525877"

  url "https://github.com/negasonicteenagewarperson/Cablehop/releases/download/v#{version}/Cablehop-#{version}.dmg"
  name "Cablehop"
  desc "Move files to and from Android phones over USB or Wi-Fi"
  homepage "https://negasonicteenagewarperson.github.io/Cablehop/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Cablehop.app"

  zap trash: [
    "~/Library/Caches/Cablehop",
    "~/Library/Logs/Cablehop",
    "~/Library/Preferences/app.cablehop.Cablehop.plist",
    "~/Library/Saved Application State/app.cablehop.Cablehop.savedState",
  ]

  caveats <<~EOS
    Cablehop isn't notarized by Apple yet. If macOS says it can't verify the app the first
    time you open it, click Done, then go to System Settings › Privacy & Security and click
    Open Anyway. You only need to do this once.

    File transfer works with no setup. For the optional extras (search, sync, screenshots,
    Wi-Fi), turn on USB debugging on the phone and install Google's platform tools:
      brew install --cask android-platform-tools
  EOS
end
