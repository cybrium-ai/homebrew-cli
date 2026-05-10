class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.8.3"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.3/cyweb-darwin-arm64"
      sha256 "f5f727923ef0846fc89a9e32d3a57ccfed41cebc6f9bf45e79d3c9c02bbb2a8e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.3/cyweb-darwin-amd64"
      sha256 "33c8386677041c0e63453cc697fdd883349129717f3fdd79550326525824f499"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.3/cyweb-linux-arm64"
      sha256 "e45208415ba92db377ce949c86da7427bd9559c110c03e4fbf7bf7d7c7a51daf"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.3/cyweb-linux-amd64"
      sha256 "bd253bd59df785613eeac5abad380069798025f24c09bc9ea6c5269a9a088e03"
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
