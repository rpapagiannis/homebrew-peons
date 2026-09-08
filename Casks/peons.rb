cask "peons" do
  version "4.2.2,13"
  sha256 "e8196978326a3b37a1e955ce57140bda3931e5a94cd8f260bc760b1ae4554eab"

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
