class Cymail < Formula
  desc     "Cybrium AI Email Security Scanner — SPF/DKIM/DMARC + reputation + leak"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.7.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.1/cymail-darwin-arm64"
      sha256 "3547631e600060043f955e7ac0b3adafa5371c2187d91fa1c0e17d9b4f99d01e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.1/cymail-darwin-amd64"
      sha256 "bbb9b980cb9cc522160c760224827781e8fa75a92bec2b44d3728db3ee991703"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.1/cymail-linux-arm64"
      sha256 "8ec1c6c4938c3503040244976e1e3b9b2cc9f79f40262da319f2a085a37564f2"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.1/cymail-linux-amd64"
      sha256 "0eb7b95d449181cca9c7153a794a4f452f9c561665d112c36ff3f239df83343d"
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
