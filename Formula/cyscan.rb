class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.6.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.1/cyscan_0.6.1_aarch64-apple-darwin.tar.gz"
      sha256 "6cd1e634e7bb9f2c340e45b314ed5e8e3d33125143200b7a21b4b4c2d396323a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.1/cyscan_0.6.1_x86_64-apple-darwin.tar.gz"
      sha256 "462b2253ddf9d4467ed656e9c1d4b7493831104c1de38f21169ee6713dcb371d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.1/cyscan_0.6.1_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "915165c18ee20ccf867194b05ccde06b8bdf4d8df3eed75a49f01ad99d1167fa"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.1/cyscan_0.6.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bda5688505fc9933471b3f2de37ecca5d15d990dcad8e4131e4f42f2daf8e333"
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
