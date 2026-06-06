class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.14"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.14/cy-tls-darwin-arm64"
      sha256 "ee124d8ddd0b9c6f9c2381481ecda0fef4b8acdfec26b3cff346e80306f879ac"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.14/cy-tls-darwin-amd64"
      sha256 "5e23037a18e1c2cd874a6278cdeeed45e1fa808999b8eb6b64a2f58116e82f58"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.14/cy-tls-linux-arm64"
      sha256 "74f771fc7a13950094601448983f20a37503523ee396866ec9554d37c696e5b8"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.14/cy-tls-linux-amd64"
      sha256 "eb7e229c111450b206723f0f58bed0db3abe1e831b4c1f6b4b1f3cb82a2f191d"
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
