class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.74"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.74/cy-tls-darwin-arm64"
      sha256 "1b8f6e9922f5c337303931248fa20cb524a5f8099658c5862b1fb927f2d184bb"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.74/cy-tls-darwin-amd64"
      sha256 "e7e9dbebd0faaa7caff323ccbc33d6db847d83706c954d2a124b471c33dd9013"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.74/cy-tls-linux-arm64"
      sha256 "7cac64de4fd777dc531865d3d2274aafbc73b911336f60dc842f2c0a36f30f3d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.74/cy-tls-linux-amd64"
      sha256 "2edae3b8560ffb7d8744cd1e66d1a5af6c7dfb9f7976b0334fcc7d5bfcf3a237"
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
