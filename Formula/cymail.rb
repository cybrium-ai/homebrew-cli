class Cymail < Formula
  desc     "Cybrium AI Email Security Scanner — SPF/DKIM/DMARC + reputation + leak"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.6.5"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.5/cymail-darwin-arm64"
      sha256 "1f9be0ed5e12a3419d7860ad9b08742f6f67219131ea23019496571e69ca5a82"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.5/cymail-darwin-amd64"
      sha256 "2784b7110617e2500439c6fcedbbe98f263b0c9752463548a78d0bff2bc53638"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.5/cymail-linux-arm64"
      sha256 "fd7a6923fed2782ab9ed9df7240122cc22fc2cc85e2cec893eda81ad3bbbd484"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.5/cymail-linux-amd64"
      sha256 "b5484ac0aea8f5a4805f7fda33ca8ed98e42c9ac1ec7ac30221cc21735d545f3"
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
