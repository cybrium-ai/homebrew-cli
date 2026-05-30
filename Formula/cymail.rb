class Cymail < Formula
  desc     "Cybrium AI Email Security Scanner — SPF/DKIM/DMARC + reputation + leak"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.5.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.0/cymail-darwin-arm64"
      sha256 "3dd577ec56deeafb45de95ad9866a22f2f281bfe18c34e495282e5909a9a624b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.0/cymail-darwin-amd64"
      sha256 "8993155a954894255d04c683d5a89417747eb4acac1876da4a23eb49bdf44eba"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.0/cymail-linux-arm64"
      sha256 "e5d42cb1de42670ce1a8c5d8ec2be66400042cde34a957b3068f32fa1209350e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.0/cymail-linux-amd64"
      sha256 "5339a18a5bac6bff72963fa4278aefd466018e81b0137f6708f973150692e48d"
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
