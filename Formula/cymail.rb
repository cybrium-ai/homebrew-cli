class Cymail < Formula
  desc     "Cybrium AI Email Security Scanner — SPF/DKIM/DMARC + reputation + leak"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.7.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.0/cymail-darwin-arm64"
      sha256 "3d609f69df109f0b7e92216606a9de44a0c685464bd15f0cb775d96c8bc8cf18"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.0/cymail-darwin-amd64"
      sha256 "67c3832f88ddf4367d5be5220c28ef82a69c184425e52fe6e68c2d3de8a7ee22"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.0/cymail-linux-arm64"
      sha256 "76dadd14171f16d78054a2843113510dbf5f5a4de9f9e8e51e901ea2ab2fa804"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.0/cymail-linux-amd64"
      sha256 "31669a280b24586ccc1b1e0903dcf5d7d59f55df107f416f9c73f9a4abc3eea2"
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
