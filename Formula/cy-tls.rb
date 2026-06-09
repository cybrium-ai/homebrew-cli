class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.75"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.75/cy-tls-darwin-arm64"
      sha256 "3a8938814f5e48c60f02521d7544988a6a44da4f09a79445b2296477ca91c2ef"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.75/cy-tls-darwin-amd64"
      sha256 "4b80d8c3acc2c3700b2962ecb34674c6c82e5ebb930ca72f751dcb09c3ced31e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.75/cy-tls-linux-arm64"
      sha256 "aba61eae7db16fbfab8203ff40df6d4d82877daf507548845832aad5eef65512"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.75/cy-tls-linux-amd64"
      sha256 "dba88941472f0a053d1375dd9cce42b97dbffcc0d110b4143b7113958dc53788"
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
