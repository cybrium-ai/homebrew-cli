class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.35"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.35/cy-tls-darwin-arm64"
      sha256 "16c50a1e4b45422261c375cef80b2ff12311bc1eab92eb2a2eea353556b90f09"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.35/cy-tls-darwin-amd64"
      sha256 "0b6315151cfa950b40df0fa81a07a81b7d968eb3e0a2843856bbe6deaffbc9a3"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.35/cy-tls-linux-arm64"
      sha256 "6f55dcaed8ce41cc8d45962004cf1121b3e9949d7dee453ac855137549f8a81f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.35/cy-tls-linux-amd64"
      sha256 "50154e8c1d440e8735bed43cb9576ebffd7b105d7223c1f45e0eb8ea2d88336d"
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
