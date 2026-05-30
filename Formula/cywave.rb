class Cywave < Formula
  desc     "Cybrium wireless RF sensor — Wi-Fi, BLE, Zigbee detection"
  homepage "https://github.com/cybrium-ai/cywave"
  license  "Apache-2.0"
  version  "0.2.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.2.1/cywave-darwin-arm64"
      sha256 "80c71b6de8b5488ab517eb30f4695e125974e3840fc73cb6591ea1053175613e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.2.1/cywave-darwin-amd64"
      sha256 "be2cb54b0d1a4941b723b57590be8ebd1f6a5ed12b2ab02654f9e04804df55fa"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.2.1/cywave-linux-arm64"
      sha256 "4dffe325cfa9b371aaef8333e576dc42e463c312428786facadf76bfbf919790"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cywave/releases/download/v0.2.1/cywave-linux-amd64"
      sha256 "3c34820ebe60a368576f58c48ad03a45fa6fdfb6a0218afa1036bd5d34fc36aa"
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
