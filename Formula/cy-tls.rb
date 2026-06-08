class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.73"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.73/cy-tls-darwin-arm64"
      sha256 "e387caca1b34ebcc6be1484aa02b0c85e1197232c61ff49c53251a6be9831cbf"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.73/cy-tls-darwin-amd64"
      sha256 "63d1ca5461c0d046db9eade9250c8eb5ae17c34346dc765673a1ed7473d3047d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.73/cy-tls-linux-arm64"
      sha256 "577584e21b41bc65d4064e6047f2cb6f92dae27a1d7e20e8752f3ad7b6ed0a73"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.73/cy-tls-linux-amd64"
      sha256 "693b203705b816f009245c59a99d1b5dc93529e31bc5bf502dc174a90bb02e7a"
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
