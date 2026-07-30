class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.6.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.1/cy-tls-darwin-arm64"
      sha256 "cc9e76fa24d35187f11538d9a0389aeef08436dc96d45661bb897c9d4fa1cdc1"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.1/cy-tls-darwin-amd64"
      sha256 "6fa124e9912a0bee37bc6c30befeeb0508def4921f3c155368a75d93cfc038ea"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.1/cy-tls-linux-arm64"
      sha256 "0e51ac7cb71dbc47b9649b43c7240cda490edc9956d9d45309ce8c9119853714"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.1/cy-tls-linux-amd64"
      sha256 "025f6ef8b768396b06829429b1403b0a01fec86c914f8e38fdff4860fa48aad8"
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
