# Homebrew tap for Peons

Installs [Peons](https://github.com/rpapagiannis/peons), a native macOS desktop companion featuring Rat Suit Rick, from its GitHub release disk images.

```sh
brew install --cask rpapagiannis/peons/peons
```

Use the fully qualified name as shown: Homebrew 6 then taps this repository and trusts this cask automatically, with no separate `brew tap` or `brew trust` step. Upgrade with `brew upgrade --cask peons`. Uninstall with `brew uninstall --cask peons`; add `--zap` to remove the preference file too.

Requires an Apple Silicon Mac running macOS 14 or later. Preview releases are ad-hoc signed, so macOS blocks the first launch with a warning that it cannot verify the app, or that it is damaged. Approve it once in **System Settings → Privacy & Security → Open Anyway**; on macOS 14, Control-click the app and choose **Open**. If macOS insists the app is damaged, run `xattr -d com.apple.quarantine /Applications/Peons.app`. Installing with `--no-quarantine` avoids the prompt by not marking the download as quarantined.

`Casks/peons.rb` is updated by the release workflow in the main repository when its `HOMEBREW_TAP_TOKEN` secret is configured. Otherwise, copy the new `version` (`<version>,<build>`) and the SHA-256 from the release's `.sha256` file into the cask by hand.
