class Cyprobe < Formula
  desc     "Cybrium Probe — OT/SCADA security scanner (Modbus, DNP3, BACnet)"
  homepage "https://github.com/cybrium-ai/cyprobe"
  license  "MIT"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.1.0/cyprobe-darwin-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.1.0/cyprobe-darwin-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_intel do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.1.0/cyprobe-linux-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cyprobe-darwin-arm64" => "cyprobe"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cyprobe-darwin-amd64" => "cyprobe"
    else
      bin.install "cyprobe-linux-amd64" => "cyprobe"
    end
  end

  test do
    assert_match "cyprobe", shell_output("#{bin}/cyprobe --version")
  end
end
