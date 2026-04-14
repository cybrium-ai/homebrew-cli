class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.1.0/cyscan_0.1.0_aarch64-apple-darwin.tar.gz"
      sha256 "6b31929543236599542bfdef65cc7bb1eea3975944eaa48b4748979aa21333ca"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.1.0/cyscan_0.1.0_x86_64-apple-darwin.tar.gz"
      sha256 "bf2d9d64add8d91078f9657becae641cb61db902312d6077bc7d0a658be28a62"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.1.0/cyscan_0.1.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2a4f5502fe291d8a83d317d105c154dda176a2c53d4825d550e049e822df66c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.1.0/cyscan_0.1.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac58ac74365543e24e029b77b6afe60b40c69ddda8e0c3002417108f78bb52cc"
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
