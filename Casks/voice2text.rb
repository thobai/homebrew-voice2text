cask "voice2text" do
  version "0.2.0"
  sha256 "09fc9d8d30c6d3dd5da50d319392cb49bef75f75cfb82c75600c6d0f6954b34a"

  url "https://github.com/thobai/voice2text/releases/download/v#{version}/Voice2Text-#{version}-arm64.tar.gz"
  name "Voice2Text"
  desc "Push-to-talk voice transcription with local AI processing"
  homepage "https://github.com/thobai/voice2text"

  depends_on arch: :arm64

  app "Voice2Text.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Voice2Text.app"]
  end

  caveats <<~EOS
    Voice2Text requires Accessibility permission for the global hotkey.
    Grant it in: System Settings > Privacy & Security > Accessibility

    To start:
      open /Applications/Voice2Text.app

    To run on login, add Voice2Text to:
      System Settings > General > Login Items

    On first run, models will be downloaded (~2.5GB total).

    Usage: Hold Right Command to record, release to transcribe and paste.
    Modes: Right ⌘ = Cleanup, ⇧ Right ⌘ = Raw, ⌥ Right ⌘ = Translate
  EOS
end
