cask "tracklaude" do
  version "0.1.0"
  sha256 "112050227c7970785d8206ac0e9099df3bc2c9fb8f89c3aedcb0bdeba2319219"

  url "https://github.com/adios-404/tracklaude/releases/download/v#{version}/tracklaude-v#{version}.zip"
  name "tracklaude"
  desc "Menu bar readout of Claude usage limits"
  homepage "https://github.com/adios-404/tracklaude"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "tracklaude.app"

  zap trash: "~/Library/Containers/com.adios404.tracklaude"

  caveats <<~EOS
    tracklaude is ad-hoc signed and not notarized, so macOS blocks the first launch.
    Open it once by hand (one time per version):
      macOS 14:  Control-click tracklaude.app in /Applications, then Open, then Open.
      macOS 15+: open it, dismiss the warning, then System Settings > Privacy & Security
                 > Open Anyway.
    Why, and how to check the download matches what CI built:
      https://github.com/adios-404/tracklaude#install

    Sign-in lives in your login Keychain (item "com.adios404.tracklaude"); `brew uninstall
    --zap` does not remove it. Sign out from the app first, or delete it in Keychain Access.
  EOS
end
