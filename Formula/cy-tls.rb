class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.66"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.66/cy-tls-darwin-arm64"
      sha256 "5882801bc57e24c2412249615798d6c755a1afb27af9c74a05ca065097cad496"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.66/cy-tls-darwin-amd64"
      sha256 "2a17280b2d8f530d303089dbaee947aa7ad9bcb78e82e6089d9cd4f76cd78b21"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.66/cy-tls-linux-arm64"
      sha256 "6408afe6e3d84ef494dc36975ce8dfce792f1e4b42b6e23070d9e0844b236fe9"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.66/cy-tls-linux-amd64"
      sha256 "05c0f49eaf0a8eeb7a36e6fb457315bbea75564c251e4ad589cc9cbb2bdd62f7"
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
