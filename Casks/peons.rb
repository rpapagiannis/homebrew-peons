cask "peons" do
  version "4.3.0,15"
  sha256 "3e6cf951d9f7adf5a871825d913b8cbd1a77c55f30e9abe448bc5d20bf640a97"

  url "https://github.com/rpapagiannis/peons/releases/download/v#{version.csv.first}-#{version.csv.second}/Peons-#{version.csv.first}-#{version.csv.second}-arm64-preview.dmg"
  name "Peons"
  desc "Desktop companion: Rat Suit Rick walks, jumps, and talks across your monitors"
  homepage "https://github.com/rpapagiannis/peons"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)-(\d+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Peons.app"

  uninstall quit: "local.rafail.pickle-rick-pet"

  zap trash: "~/Library/Preferences/local.rafail.pickle-rick-pet.plist"
end
