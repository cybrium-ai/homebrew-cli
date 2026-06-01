class Cymail < Formula
  desc     "Cybrium AI Email Security Scanner — SPF/DKIM/DMARC + reputation + leak"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.6.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.0/cymail-darwin-arm64"
      sha256 "f62a79a85f25a9110102cedebf08deec6e18d3546df4370e7247753ba832243a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.0/cymail-darwin-amd64"
      sha256 "f7160293797dab0840225afbff0b441d448d186116f1ba5297713c20ab829ec7"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.0/cymail-linux-arm64"
      sha256 "f95d0ec40316d1a6d7c854085ab3b11d34a28a5fb1430294d12025d3e1b0adf5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.0/cymail-linux-amd64"
      sha256 "45f3602939e9f24bf9a0d6f4fea150962324f45f62f49efa104a0c323ef65057"
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
