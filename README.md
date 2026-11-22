# lichengwu/homebrew-tap

Personal Homebrew casks.

## DialPilot

macOS menu-bar companion for the Ulanzi AU05 (VibeKey) dial controller —
seven custom bindings plus coding-agent status on the device LEDs.

```sh
brew install --cask lichengwu/tap/dialpilot
```

Upgrade with `brew upgrade --cask dialpilot`; remove with
`brew uninstall --cask dialpilot`.

The cask pins the release image's SHA-256 and clears the quarantine flag after
installing, so the app opens on the first double-click. DialPilot is signed
ad-hoc and is **not notarized** — see the [project README](https://github.com/lichengwu/dialpilot#install)
for why, and for the manual install path if you would rather not use Homebrew.

Prefer the script channel?

```sh
curl -fsSL https://raw.githubusercontent.com/lichengwu/dialpilot/main/scripts/install.sh | sh
```
