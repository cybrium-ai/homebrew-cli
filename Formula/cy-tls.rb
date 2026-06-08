class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.51"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.51/cy-tls-darwin-arm64"
      sha256 "4da81dfc41e509a097635be7021a6a8804f7e92480693907327adc5201b9e724"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.51/cy-tls-darwin-amd64"
      sha256 "eb82ac50a7032dec2f9e6e831f3b3afb3574c0a84e182f09e1469d0a8c3726ac"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.51/cy-tls-linux-arm64"
      sha256 "6698c614e3392f5b9bbd66c52bca5a8ceeffd4e21b804957fc61aba70868c977"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.51/cy-tls-linux-amd64"
      sha256 "9e106e0f07e8f8802f52f5569648e997186f7cb2dceecbb517386aec8218612a"
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
