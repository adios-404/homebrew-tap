cask "tracklaude" do
  version "0.1.0"
  sha256 "6ba3f5e1726f53003ea6f9e7fc34b442d2ad8429c643ad4385998966e4dedefa"

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
