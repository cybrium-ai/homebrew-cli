class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.3.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.3.0/cymail-darwin-arm64"
      sha256 "891fa4547c5d82b5ff214ebb6ae22bd5e5ed71e7eca7aafe9902e6dd33acdfd6"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.3.0/cymail-darwin-amd64"
      sha256 "a1a14f80832f5cfcc2f4531cc27296d1962a657bce567eca7ebe5ae17b22ba7e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.3.0/cymail-linux-arm64"
      sha256 "ed469c20a58c2c762ba83d96ab4923e1c206590efe104a1c1a83acad7fedfbeb"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.3.0/cymail-linux-amd64"
      sha256 "6ad6d282d75fdb0787af584e3743ad614c5e0315a51528bcb848be3f6c35cd17"
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
