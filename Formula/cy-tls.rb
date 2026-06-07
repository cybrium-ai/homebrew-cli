class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.3.7"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.7/cy-tls-darwin-arm64"
      sha256 "afb313a6845585e3c8ebe34aeec78345a34ef8a94efbcc057c1c2b1053b26613"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.7/cy-tls-darwin-amd64"
      sha256 "3a9047e322a748c93be1dd10e883c65c4a3f62f835f752b87c34080aea42cb22"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.7/cy-tls-linux-arm64"
      sha256 "c2567e3611f7aa0510a70cb5aff8873e8eddddbcfbde02a58f6523e0126e87fe"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.7/cy-tls-linux-amd64"
      sha256 "cce868fb2d12751f54584329ec972be944618fac2377162702e73791d9f7909f"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cy-tls-darwin-arm64" => "cy-tls"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cy-tls-darwin-amd64" => "cy-tls"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cy-tls-linux-arm64"  => "cy-tls"
    else
      bin.install "cy-tls-linux-amd64"  => "cy-tls"
    end
  end

  test do
    assert_match "cy-tls", shell_output("#{bin}/cy-tls --version")
  end
end
