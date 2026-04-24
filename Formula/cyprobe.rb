class Cyprobe < Formula
  desc     "Cybrium Probe — OT/SCADA security scanner (Modbus, DNP3, BACnet)"
  homepage "https://github.com/cybrium-ai/cyprobe"
  license  "Apache-2.0"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.1.0/cyprobe-darwin-arm64"
      sha256 "a241059371e518c3ee175a3a11acea30fbb99cc033655ed1efb0d93df404ea75"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.1.0/cyprobe-darwin-amd64"
      sha256 "d2720818e5d5092edc337b3a52086d7ee436a1c26760bdda4ad6328a43c8402c"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.1.0/cyprobe-linux-arm64"
      sha256 "4f8e1dc5f38c72a27e1b1836b6cfd58f34a403f2792ae7ff2609fa0f09c20041"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.1.0/cyprobe-linux-amd64"
      sha256 "ac60149a77d4840f397224d53d7b106addbfd438e55cb7c8261bbb2e1048d9ac"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cyprobe-darwin-arm64" => "cyprobe"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cyprobe-darwin-amd64" => "cyprobe"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cyprobe-linux-arm64" => "cyprobe"
    else
      bin.install "cyprobe-linux-amd64" => "cyprobe"
    end
  end

  test do
    assert_match "cyprobe", shell_output("#{bin}/cyprobe --version")
  end
end
