class Cywave < Formula
  desc     "Cybrium wireless RF sensor — Wi-Fi, BLE, Zigbee detection"
  homepage "https://github.com/cybrium-ai/cywave"
  license  "Apache-2.0"
  version  "0.2.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.2.0/cywave-darwin-arm64"
      sha256 "a4384f807d05cfc9e8b9d40e185ac7f644b0e63e0e4a832f7e7c9b5931d00000"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.2.0/cywave-darwin-amd64"
      sha256 "588a5e9e1ba2a54948ab55d98c852cecb9fa2f1dc4792599d7d0fbb2d4aba7a9"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.2.0/cywave-linux-arm64"
      sha256 "7fae2e321c247fede87606164958ae365a3c62f7a594594ae09518ac0bcdc6e0"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.2.0/cywave-linux-amd64"
      sha256 "74922dcd73433c24c98f0823722c7b3ccf8ed5de3c02b501f6688d598bab4fad"
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
