class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "MIT"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.1.0/cyweb-darwin-arm64"
      sha256 "891dc12d0a35555c121898469eab9591feae103b4366bf3c6f2d3d19c8a0752c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.1.0/cyweb-darwin-amd64"
      sha256 "3fdb65d8608931f8f56893ce0d9cb7b17c89d44f55c326f637bb0305f586c5ad"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.1.0/cyweb-linux-arm64"
      sha256 "6dd9d9562237bdd8b93c4eaea014e76d09df6a8a156376763130fac3f941f5e2"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.1.0/cyweb-linux-amd64"
      sha256 "86067c636b28547bef2dbd20799a6371de1c3c18b94ece810e666dc3d8cad1ae"
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
