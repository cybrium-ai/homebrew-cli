class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.32"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.32/cy-tls-darwin-arm64"
      sha256 "37eb930bc68323c3566ceb76870c100286e9508f1c0666df7a79e06e40e55b50"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.32/cy-tls-darwin-amd64"
      sha256 "8a047da218ff7d4ea9a0a3311c6c4e0f710676eef98dc3664ef981a06d0433dd"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.32/cy-tls-linux-arm64"
      sha256 "93827bc97b4c4cd2504515eca107df75272dfeb6898c2cb849e5c64dd11d9125"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.32/cy-tls-linux-amd64"
      sha256 "6bea36375fb2e19aadcec84407c4fa85307661eb6ced1bf643d5abd745e709cd"
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
