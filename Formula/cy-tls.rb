class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.52"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.52/cy-tls-darwin-arm64"
      sha256 "a1a3eb091de98935b46bd5bf1906052631b5ee5bde200e5ddd7b7ef0790b3bd4"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.52/cy-tls-darwin-amd64"
      sha256 "23c81ee230ddaa0bc17353bc83b87c1bd34bb9f2ce5fa093ca5611b665c34ef2"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.52/cy-tls-linux-arm64"
      sha256 "cc3c78385e10cff6ff7c011e25cd857b461b9abfda2e9f0e4b84ab3d26db7bff"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.52/cy-tls-linux-amd64"
      sha256 "e212b1f848a26e10bab1dee73b69e00e0dc24994fea6e2fb727300fb7a5d66ad"
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
