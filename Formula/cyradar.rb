class Cyradar < Formula
  desc     "Cybrium Radar — active discovery probe for AI inference servers"
  homepage "https://github.com/cybrium-ai/cyradar"
  license  "Apache-2.0"
  version  "0.1.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.2/cyradar_0.1.2_aarch64-apple-darwin.tar.gz"
      sha256 "05b277e9b5e066c17b6ba5ebd661538be75941533366a52cff7a0a518b5cd78b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.2/cyradar_0.1.2_x86_64-apple-darwin.tar.gz"
      sha256 "96728fabd58b3dfc5ed5f83b584ae700f259801fc4e30c3625951379a76034f1"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.2/cyradar_0.1.2_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4fdbe01507f4ba7796fc6100782da4007e0d0600bd5db7229c640a18a5e7b8c6"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.2/cyradar_0.1.2_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78d4515c3db8461bfca651435a6de329f3f35824e9de0f8fb8ab68604e19797b"
    end
  end

  def install
    bin.install "cyradar"
    (prefix/"rules").install Dir["rules/*"]
  end

  test do
    system "#{bin}/cyradar", "version"
  end
end
