class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner (Nikto replacement)"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.7.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.1/cyweb-darwin-arm64"
      sha256 "37dc169513d978cc3cacccbd6fc90a02908a26f409052356880dc84a07a65e5a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.1/cyweb-darwin-amd64"
      sha256 "c4ca5b2b3a6f8d6c6d6bb0aca4170bb8fa26be3089b4d4c5d22f483703a22dcb"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.1/cyweb-linux-arm64"
      sha256 "8303f1d6f99f1e03da396df619d546d62e6345b2c182d8486c72fbc20a6a3c3c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.1/cyweb-linux-amd64"
      sha256 "04f725fae7c6ac3a28f94bd0056c5156bf5298021eccbbd3c9bef0fdad8051c6"
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
