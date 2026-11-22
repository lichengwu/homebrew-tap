cask "dialpilot" do
  version "1.1.3"
  sha256 "76ddbc7c74169e4562399df4931a64a05c69dbfe07a2b19be1cf0cf0aa1ba31a"

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
