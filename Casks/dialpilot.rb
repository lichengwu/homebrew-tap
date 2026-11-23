cask "dialpilot" do
  version "1.1.4"
  sha256 "826d9e445f8fe2fd8582b48606887ad61c994bbb30c26f9cf8e762fd96019fbb"

  url "https://github.com/lichengwu/dialpilot/releases/download/v#{version}/DialPilot-#{version}.dmg"
  name "DialPilot"
  desc "Menu-bar companion for the Ulanzi AU05 (VibeKey) dial controller"
  homepage "https://github.com/lichengwu/dialpilot"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "DialPilot.app"

  # Homebrew marks cask downloads quarantined, so Gatekeeper would block the
  # first launch of this (deliberately ad-hoc signed, non-notarized) app.
  # Clearing the flag here means "brew install" ends with a working app; the
  # trust decision is the sha256 above plus this tap's provenance.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{appdir}}/DialPilot.app"]
  end

  caveats <<~EOS
    DialPilot is not notarized. This cask clears the quarantine flag so the app
    opens on first launch; if you installed it another way, allow it under
    System Settings → Privacy & Security → "Open Anyway".

    After launching, grant Input Monitoring and Accessibility in
    System Settings → Privacy & Security, and quit Ulanzi Studio first —
    both apps talk to the same dial.

    Each release is a new ad-hoc signing identity, so upgrading drops those two
    grants while System Settings still shows the switches as on. After
    "brew upgrade", turn DialPilot off and back on in both panes, then relaunch.
  EOS
end
