class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.55"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.55/cy-tls-darwin-arm64"
      sha256 "9043015780c9ed52d191287d27b0a0a7d8dbc85047341c715869ecd02286ed5a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.55/cy-tls-darwin-amd64"
      sha256 "dbc423a4d902e94541730c28e50ffcbea8a9bcce1401c76934b5975c0fe5e1a7"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.55/cy-tls-linux-arm64"
      sha256 "a68e94fdecbb68e9bd7601ed74225d4ab416020fc25bc3b6b0693ee4a5e18c93"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.55/cy-tls-linux-amd64"
      sha256 "a5cb49bc40c5fc93f26314f56103e41fb127923f7875ea368c7cc3088efbc654"
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
