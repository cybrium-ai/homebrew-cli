class Cyradar < Formula
  desc     "Cybrium Radar — active discovery probe for AI inference servers"
  homepage "https://github.com/cybrium-ai/cyradar"
  license  "Apache-2.0"
  version  "0.1.8"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.8/cyradar_0.1.8_aarch64-apple-darwin.tar.gz"
      sha256 "09837267dfd9dd9ac4d266cc2f88fe1ce35cef9a35d3bb1fb5d4eee683dcaac4"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.8/cyradar_0.1.8_x86_64-apple-darwin.tar.gz"
      sha256 "e4879d3ac1c71eb458983de44540245f1c4e6e5d1323c51d24e41555306e0075"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.8/cyradar_0.1.8_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ed2a03303bd2f977f02405de6e2b1ff6bdc7dfc9bb3e7ece62f36e92758ee2d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.8/cyradar_0.1.8_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "073256ac852537d1b433aed469881bbc9e3a6cd77f081602b6d3bc99eff136be"
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
