class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.4.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.2/cy-tls-darwin-arm64"
      sha256 "8b3660e948625ece2382a8317529cbfd42421cb01e80fa0b54069bea0aaf21d5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.2/cy-tls-darwin-amd64"
      sha256 "86cc796309bdf54ffa69e83146fd6d76e6a5477919299035795be4e9b158fdd1"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.2/cy-tls-linux-arm64"
      sha256 "5f091d26db755d5f412dd5e298be53ba344a78c22ff3cce096e060d6785bb379"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.2/cy-tls-linux-amd64"
      sha256 "b25b3ca84bfe83f1d8ec2d443be8d4c80a98427f8719f145ea22f0f9f5f1b8e6"
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
