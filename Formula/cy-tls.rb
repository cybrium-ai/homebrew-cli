class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.16"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.16/cy-tls-darwin-arm64"
      sha256 "d98b50772f5dcd6627338ef1cb8fb14b0e37a70709084ba09d89ecdd8ad0c404"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.16/cy-tls-darwin-amd64"
      sha256 "2cf3fa8f7daf5f25f50839b28104110b3d4969cbb7e3d9f6237e65d508084a80"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.16/cy-tls-linux-arm64"
      sha256 "2fa9e0df5850cee7e40a751c9cf6d6b7cadc38037a56a9b2456db39045d74e3a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.16/cy-tls-linux-amd64"
      sha256 "8e1e29cae1d081b99e1b6fa514f87da52c3380a0bc7d3bfdddbc350fede6a2cb"
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
