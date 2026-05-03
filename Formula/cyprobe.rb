class Cyprobe < Formula
  desc     "Cybrium Probe — OT/SCADA security scanner (Modbus, DNP3, BACnet)"
  homepage "https://github.com/cybrium-ai/cyprobe"
  license  "Apache-2.0"
  version  "0.2.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.2.2/cyprobe-darwin-arm64"
      sha256 "b06d36897a68ea362d966c9d07ee7d9236b3975b5d1f7bfb4623a905f610e40b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.2.2/cyprobe-darwin-amd64"
      sha256 "0a58d54f158ef6601de71e2b76d2830123d73a6edcfd1707b59f09a44cd158df"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.2.2/cyprobe-linux-arm64"
      sha256 "a21a2fc3652d8b90b1602b8808e7d0bc1df88afc2c9bc5fcb6dc0fe5e6d9a475"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyprobe/releases/download/v0.2.2/cyprobe-linux-amd64"
      sha256 "f6e01ffd0dccd27086383db84be54ab3d86ebeb7ead52f1071fc236412576b96"
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
