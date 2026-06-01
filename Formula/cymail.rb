class Cymail < Formula
  desc     "Cybrium AI Email Security Scanner — SPF/DKIM/DMARC + reputation + leak"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.6.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.2/cymail-darwin-arm64"
      sha256 "c8cb459d3521d2a04a6de7a40512b27b8af875f141817ef5b0e7a469cd783a27"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.2/cymail-darwin-amd64"
      sha256 "406f1a48b0f278383b53939460df1ad78882661eaa9e8e99c362a564578bfd24"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.2/cymail-linux-arm64"
      sha256 "ac1755dbd63b7628ff55a8c2fab8b55e4f4abcc49a5b03fd34b5543e6a547884"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.2/cymail-linux-amd64"
      sha256 "d9cd6960bb71d7c79b54b7ebe191bfdc0dba1d73f18a150091558980afa9b5cd"
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
