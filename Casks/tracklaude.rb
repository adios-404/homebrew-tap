cask "tracklaude" do
  version "1.0.5"
  sha256 "5979e93772d007ce2b834dc2de2acc230986a058800639448c38933bdb6488fa"

  url "https://github.com/adios-404/tracklaude/releases/download/v#{version}/tracklaude-v#{version}.zip"
  name "tracklaude"
  desc "Menu bar readout of Claude usage limits"
  homepage "https://github.com/adios-404/tracklaude"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "tracklaude.app"

  zap trash: "~/Library/Containers/com.adios404.tracklaude"

  caveats <<~EOS
    tracklaude is ad-hoc signed and not notarized, so macOS blocks the first launch.
    Open it once by hand (an update may ask again):
      macOS 14:  Control-click tracklaude.app in /Applications, then Open, then Open.
      macOS 15+: open it, dismiss the warning, then System Settings > Privacy & Security
                 > Open Anyway.
    After each update, the new version's first launch asks for your login password twice
    (the Keychain, not the app). Enter it both times; it is expected: each version has a
    new code hash, and your saved sign-in is bound to it. A first sign-in does not ask.
    Why, and how to check the download matches what CI built:
      https://github.com/adios-404/tracklaude#install

    Sign-in lives in your login Keychain (item "com.adios404.tracklaude"); `brew uninstall
    --zap` does not remove it. Sign out from the app first, or delete it in Keychain Access.
  EOS
end
