class Cymail < Formula
  desc     "Cybrium email security scanner — SPF, DKIM, DMARC scoring"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "MIT"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.0/cymail-darwin-arm64"
      sha256 "203a61b0b7617dd943637cc1d33d8aaa7fd20375fba1e0fbf2a7f64ec16845da"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.0/cymail-darwin-amd64"
      sha256 "cf9fff0bb68a34bca91bb6383d6dc9a6415f1cf7df9ab70c9e67aeb264470e7a"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.0/cymail-linux-arm64"
      sha256 "d988be71970c96b326e37755f0e4a8e60c00e7e1ad08e54be3ae697792cfee93"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.0/cymail-linux-amd64"
      sha256 "26b008af0fc44d0614e69a79f2067b7695e8743683c003764b3985ccae98c9dc"
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
