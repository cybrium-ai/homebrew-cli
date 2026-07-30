class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.6.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.0/cy-tls-darwin-arm64"
      sha256 "09945ef04419175f019597d107da56d195e2545648e8db6496c20ced3a5fad6c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.0/cy-tls-darwin-amd64"
      sha256 "d8077b5757d594735b2118c106b6544093f3a4bd7e205cb71a133de306c455b6"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.0/cy-tls-linux-arm64"
      sha256 "ff6cc90aeefd5ad91b81d21f697939f4eac4117c0e07f0bf5254719f0ed69feb"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.0/cy-tls-linux-amd64"
      sha256 "5438bf4f636ef13ff1e8f1bfe5190a57f5ec1bdaf1cee1330b92376b510523fe"
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
