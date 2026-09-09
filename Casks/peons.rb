cask "peons" do
  version "4.3.0,14"
  sha256 "5b45e89df05c37585aeacabff6c2daeb3abfad1f00571bbbb5d5df7f9a2ad9a1"

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
