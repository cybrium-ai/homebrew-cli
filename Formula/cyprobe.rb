class Cyprobe < Formula
  desc     "Cybrium Probe — OT/SCADA security scanner (Modbus, DNP3, BACnet)"
  homepage "https://github.com/cybrium-ai/cyprobe"
  license  "Apache-2.0"
  version  "0.2.4"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.2.4/cyprobe-darwin-arm64"
      sha256 "a4e917b2c5db1fb77ff494f53d2c06ff5a47d8f2ed5b65b0a6211156576a6295"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.2.4/cyprobe-darwin-amd64"
      sha256 "d91ea0b2a7eedf2311fd8c52eeba4aaef1200474bb9f4a8c2cf7bd6b7fe4c3b5"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.2.4/cyprobe-linux-arm64"
      sha256 "d0c75e89047f7877be5bf40eecfca3101422015f0e542985714b142fff74021c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.2.4/cyprobe-linux-amd64"
      sha256 "23e58f3f787aa0e5c18724134fa18b63bb8496bb50443e9e889673012310e857"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cyprobe-darwin-arm64" => "cyprobe"
    elsif OS.mac?
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
