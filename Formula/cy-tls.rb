class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.5"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.5/cy-tls-darwin-arm64"
      sha256 "18ed91efc69bf88080f1992a86aa5f95cc809a8c7c0764a233fdd783b18aa15e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.5/cy-tls-darwin-amd64"
      sha256 "1d3237ceeed7d39bac3d784235ba6d50804b975cffa098bb5001848b236053b4"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.5/cy-tls-linux-arm64"
      sha256 "a365a36a3724f70e759ce065e39b3a55f43527536a90162381f3fd10473f0628"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.5/cy-tls-linux-amd64"
      sha256 "5679c4856588c166a15c86bc377a630b2b2191e86a93f5a577eb57a351bbbf46"
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
