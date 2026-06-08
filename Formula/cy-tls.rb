class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.61"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.61/cy-tls-darwin-arm64"
      sha256 "5a010784824d30b704d8b7ba228fb30843a9a881255e10642f61627f7f62863b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.61/cy-tls-darwin-amd64"
      sha256 "4d40451abcefdca33b8824b3293c8b0445c0b9d628683cbccfcb7b48ee1f09e6"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.61/cy-tls-linux-arm64"
      sha256 "684434022f2a906ec248034b1c1e9168e565a76bdec2dc469c8bf9404e83e5d0"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.61/cy-tls-linux-amd64"
      sha256 "bcbd3599b14cee9a2b598843724a5e52305974ce313bcdbae28b72191d5c2d9b"
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
