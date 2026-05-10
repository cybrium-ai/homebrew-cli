class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.8.4"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.4/cyweb-darwin-arm64"
      sha256 "51734db7219649b1b1d592240b5310107d8eb0cc7a2bfce069cb5d926548d12c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.4/cyweb-darwin-amd64"
      sha256 "955a6da7b7f523d09a78c91132cb2e050ae103f95528dd171912ef53fae639cf"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.4/cyweb-linux-arm64"
      sha256 "dc2e09ade89d44513e63815810ee799aa8773ce682fcd930fbcea4fee8ef81b6"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.4/cyweb-linux-amd64"
      sha256 "865d980f638ba1962b131530e0e5e70c61f23f0faa356b4a864503a2152fef3a"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cyweb-darwin-arm64" => "cyweb"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cyweb-darwin-amd64" => "cyweb"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cyweb-linux-arm64" => "cyweb"
    else
      bin.install "cyweb-linux-amd64" => "cyweb"
    end
  end

  test do
    assert_match "cyweb", shell_output("#{bin}/cyweb version")
  end
end
