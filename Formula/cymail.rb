class Cymail < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.5.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.2/cymail-darwin-arm64"
      sha256 "413ff9d516c182db4615e0ddb586f4637bdb76eb08e6d94b0004ef7d22e75664"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.2/cymail-darwin-amd64"
      sha256 "e652e72a112ec5ad7fac7521481e6e5799109a8e7ecc13257121c0a14b0ce8bc"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.2/cymail-linux-arm64"
      sha256 "8b4d8f84f8a4ae9e3302f67c39d54a5d9fb121930ace171ac64fa383bff35371"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.2/cymail-linux-amd64"
      sha256 "47d55bac6f4cc3b09bb50c7d142ea035ea2f1849cfb8999812379394508a651e"
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
