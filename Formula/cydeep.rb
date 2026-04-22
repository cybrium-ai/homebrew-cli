class Cydeep < Formula
  desc     "Cybrium PLC deep inspection — Purdue Level 0 visibility"
  homepage "https://github.com/cybrium-ai/cydeep"
  license  "MIT"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.0/cydeep-darwin-arm64"
      sha256 "c9a5802a82e330c6d1ff30b1f5df69009d88282f2a2ad548cc163fe951f62342"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.0/cydeep-darwin-amd64"
      sha256 "b90c1aa783901fe5886df1aed454b1afd754ae4ed27b275211df51b33c3d1527"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.0/cydeep-linux-arm64"
      sha256 "ab7259ec1dc5ccf4a8a5e37f94679e2b90acfd335e9ed0f1f8af10db39056cff"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.0/cydeep-linux-amd64"
      sha256 "552a49fa5471f21f70ad8d136bd655f0253189b4628df741c856e16859aaf89b"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cydeep-darwin-arm64" => "cydeep"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cydeep-darwin-amd64" => "cydeep"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cydeep-linux-arm64" => "cydeep"
    else
      bin.install "cydeep-linux-amd64" => "cydeep"
    end
  end

  test do
    assert_match "cydeep", shell_output("#{bin}/cydeep version")
  end
end
