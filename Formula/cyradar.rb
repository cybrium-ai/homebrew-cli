class Cyradar < Formula
  desc     "Cybrium Radar — active discovery probe for AI inference servers"
  homepage "https://github.com/cybrium-ai/cyradar"
  license  "Apache-2.0"
  version  "0.1.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.1/cyradar_0.1.1_aarch64-apple-darwin.tar.gz"
      sha256 "d289cbe61114269d083ba6ec9d87a5f9e01de7a2a09938d9606acdea5301ca48"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.1/cyradar_0.1.1_x86_64-apple-darwin.tar.gz"
      sha256 "b5f8f495b37dade25b43faa9b6397be19693ca74d56a0f05349f37822a3dee8d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.1/cyradar_0.1.1_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e01f3e3fa674404bcaa51a44e6cef2aa62dfe30768a2795ef1598c53b145ba3d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.1/cyradar_0.1.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd359a9d73d45043799ec2085b6da8c4285c084b1b6f5c513e93000194910440"
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
