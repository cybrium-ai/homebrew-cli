class Cywave < Formula
  desc     "Cybrium wireless RF sensor — Wi-Fi, BLE, Zigbee detection"
  homepage "https://github.com/cybrium-ai/cywave"
  license  "MIT"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.1.0/cywave-darwin-arm64"
      sha256 "d599f4e3be629d891dab85fa3ff3a88e50b698d496c5b6c0cef1e6268d4cf611"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.1.0/cywave-darwin-amd64"
      sha256 "02c650d2a86814aaba286db05d40248e0be656e408bf5470e708663718436b98"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.1.0/cywave-linux-arm64"
      sha256 "eae241fb479e97aa2c61745e1d245f71737582c7d5a5fb6d7aff540207379038"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.1.0/cywave-linux-amd64"
      sha256 "783c4c676384cb576e678a27759fc24ea9f963e643cc735ddfbe2c9a6eee149c"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cywave-darwin-arm64" => "cywave"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cywave-darwin-amd64" => "cywave"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cywave-linux-arm64" => "cywave"
    else
      bin.install "cywave-linux-amd64" => "cywave"
    end
  end

  test do
    assert_match "cywave", shell_output("#{bin}/cywave version")
  end
end
