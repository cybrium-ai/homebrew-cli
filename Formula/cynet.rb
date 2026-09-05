class Cynet < Formula
  desc     "Cybrium native network scanner — host discovery + port/service scan"
  homepage "https://github.com/cybrium-ai/cynet"
  license  "Apache-2.0"
  version  "0.2.0"

  # Prebuilt binaries live in the public cynet-releases mirror (source is
  # private in cybrium-ai/cynet). v0.2.0 ships macOS arm64, Linux x86_64
  # (musl) and Windows x86_64; Homebrew covers the mac/linux targets.
  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cynet-releases/releases/download/v0.2.0/cynet_0.2.0_aarch64-apple-darwin.tar.gz"
      sha256 "8dd8b8e7fc2c0f853decc504564abd3c0d6ad15c90d1150bb6b6056fa8a584d4"
    end
  end

  on_linux do
    on_intel do
      url    "https://github.com/cybrium-ai/cynet-releases/releases/download/v0.2.0/cynet_0.2.0_x86_64-unknown-linux-musl.tar.gz"
      sha256 "cfd71c9349e9ba2eb00016e79af96b6027bf50cdac6e1b7df477bce868413f5f"
    end
  end

  def install
    bin.install Dir["**/cynet"].first => "cynet"
  end

  test do
    assert_match "cynet", shell_output("#{bin}/cynet --version")
  end
end
