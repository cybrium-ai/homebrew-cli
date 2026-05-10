class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.8.7"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.7/cyweb-darwin-arm64"
      sha256 "a20e6f4ce3c6f2c9550ee84a6fed3db22c1445cb0da5636d68bade25da152cc0"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.7/cyweb-darwin-amd64"
      sha256 "f4c60855daf01eb76b6117219ea70efdd0aa7736c524925170b3f602df278fce"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.7/cyweb-linux-arm64"
      sha256 "c1ba742b20a52d6c0e6172a894063b66d93af1385f4bdffc11cc54e933a445f7"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.7/cyweb-linux-amd64"
      sha256 "e55089ad75bf2f0c8c45a65b55a49a29b47664b97faf1e1825b4eae3e15b0846"
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
