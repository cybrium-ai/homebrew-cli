class Cymail < Formula
  desc     "Cybrium AI Email Security Scanner — SPF/DKIM/DMARC + reputation + leak"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.5.4"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.4/cymail-darwin-arm64"
      sha256 "55c9e2b1f2cde03c8c098d339844fd9136dc85314931f971acaf630a7b1723cb"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.4/cymail-darwin-amd64"
      sha256 "47195a0cbbff1058b85bb90b1e6096a1351c344b7f2e5b51f8504a72b7f57d17"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.4/cymail-linux-arm64"
      sha256 "9b4aee096bb429eda399ef61edd44585fec79be72e2e96db89d41e822fc7777a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.4/cymail-linux-amd64"
      sha256 "8454022155354603d9aa17240be7fd6f27396f57c5510b95a7ff8674a08c83d1"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cymail-darwin-arm64" => "cymail"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cymail-darwin-amd64" => "cymail"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cymail-linux-arm64" => "cymail"
    else
      bin.install "cymail-linux-amd64" => "cymail"
    end
  end

  test do
    assert_match "cymail", shell_output("#{bin}/cymail version")
  end
end
