class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.1.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.1.1/cyscan_0.1.1_aarch64-apple-darwin.tar.gz"
      sha256 "a1aa74d59e126756614b1003b8cc036714518a06b4fcf0d2b044d871e3a5fd3f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.1.1/cyscan_0.1.1_x86_64-apple-darwin.tar.gz"
      sha256 "4eeb60dad5e8b1c88bd06344518e54069f01951ff2524bff025d45291c211e7b"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.1.1/cyscan_0.1.1_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "266ebc54bdeaf0a7f22520ede74adfe05d385b0c418fa0e0a44e2c71c32b0f7c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.1.1/cyscan_0.1.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c12bbc14a0390b67d5ff9c0c336a1f652a01ebe24bbc59138a6b96e60c6f6680"
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
