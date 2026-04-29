class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.9.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.9.0/cyscan_0.9.0_aarch64-apple-darwin.tar.gz"
      sha256 "ba240fee9bf94d35dea4adcf01f8a3efc8b08c01bde93c7ad188299f33edc3e6"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.9.0/cyscan_0.9.0_x86_64-apple-darwin.tar.gz"
      sha256 "fa4546098b17301534e4f01fe807b5f769a75f59a7db48be8c102951fdb802a0"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.9.0/cyscan_0.9.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1643d8c70dde21280939d8d915800fde8b2fafe40e097e4de25a9ca86c612840"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.9.0/cyscan_0.9.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82175d9120927b45fc6e157b600ef8b897582fb087b909e05c979b51c209b81d"
    end
  end

  def install
    bin.install "cyscan"
    (prefix/"rules").install Dir["rules/*"]
  end

  test do
    system "#{bin}/cyscan", "--version"
  end
end
