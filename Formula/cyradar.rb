class Cyradar < Formula
  desc     "Cybrium Radar — active discovery probe for AI inference servers"
  homepage "https://github.com/cybrium-ai/cyradar"
  license  "Apache-2.0"
  version  "0.1.9"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.9/cyradar_0.1.9_aarch64-apple-darwin.tar.gz"
      sha256 "789091ec3996badac5b065bdeba1ff2d76a95798bd7d786dd06b90548d7b38ae"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.9/cyradar_0.1.9_x86_64-apple-darwin.tar.gz"
      sha256 "e31e0dccbe97a0cb81e125f1187322b5822469d7058373dc7347ced1a2dd9311"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.9/cyradar_0.1.9_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "409218753c691d3f051cd8a389a2e53a51e28d3138fc43b15a3e3cfcaa9ab8c5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.9/cyradar_0.1.9_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f4e714b08d5d023ed89071f49ee24c9ca63099e4212c968c27c8933cfec1748"
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
