class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.2.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.2.0/cyscan_0.2.0_aarch64-apple-darwin.tar.gz"
      sha256 "b6a53ddea967d7dee3ee7763c256bb1e637abc1348d0d99d6a906dda51ee7e60"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.2.0/cyscan_0.2.0_x86_64-apple-darwin.tar.gz"
      sha256 "30ea42a1c43ec0f94d9cb3c0a776846f220a3b14d65fffba1317691b0830ab74"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.2.0/cyscan_0.2.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5a2659e2a20349480d443995acfb12ce7357debe3bb8a859f933bbcd56fa722"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.2.0/cyscan_0.2.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4b49829df994039b1b7aaf3ed2fdaa69abb414703e82223dc281bf274b31061"
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
