class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "1.1.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.1/cyscan_1.1.1_aarch64-apple-darwin.tar.gz"
      sha256 "c60fa3cc4e17719275311a88d04a73e0a05555c1a0d0d67f8ca6fdf16d5e7fb2"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.1/cyscan_1.1.1_x86_64-apple-darwin.tar.gz"
      sha256 "cfc0577c6d5a6b0c5b07d4d52ea33613a2c75793b375070fd9370ad9500fd724"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.1/cyscan_1.1.1_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d38171939a194b211dce8bf721167ab3740538f33c3a7d9a719a98793a4bc203"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.1/cyscan_1.1.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b7bd00f97fd0315516693425c5e5da47572528e0d788783d44f6e362392322a"
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
