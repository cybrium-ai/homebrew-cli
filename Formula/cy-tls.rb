class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.42"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.42/cy-tls-darwin-arm64"
      sha256 "85b9c4f7887d2c44a3927ea229793929dcccee11cab1993077cc99d7ad9c3139"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.42/cy-tls-darwin-amd64"
      sha256 "135bee41a43629771b7aff1bea2859ff734c01b38f0ae9e24e99db779851d230"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.42/cy-tls-linux-arm64"
      sha256 "3e1d60b1956189886c893459143c327d6ec3ddd5e23046b2e018db66dbac959e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.42/cy-tls-linux-amd64"
      sha256 "d54f50855012c6435dbd25749852bc5496d6aec35c0462fc3bd56e7e46288f7f"
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
