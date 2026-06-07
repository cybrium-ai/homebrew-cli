class Cymail < Formula
  desc     "Cybrium AI Email Security Scanner — SPF/DKIM/DMARC + reputation + leak"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.7.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.0/cymail-darwin-arm64"
      sha256 "dbdb885a0d71324280538168e7df9eef117f2ab8610235f4342ed8f1a45ceda6"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.0/cymail-darwin-amd64"
      sha256 "f318303a33bec0add3b9e44a60de2de3f57c40d7de05bfbbce326a0d0f1eb8e8"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.0/cymail-linux-arm64"
      sha256 "fd7a6923fed2782ab9ed9df7240122cc22fc2cc85e2cec893eda81ad3bbbd484"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.7.0/cymail-linux-amd64"
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
