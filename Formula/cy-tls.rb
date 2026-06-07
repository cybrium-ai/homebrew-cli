class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.4.3"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.3/cy-tls-darwin-arm64"
      sha256 "354c04f3e63b4aa71fbc308f2c7d872828209a6eb39a1af3a5efef19e7e6d975"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.3/cy-tls-darwin-amd64"
      sha256 "34de86f9fadc1ed1a2f135480c5f2b7aa37143cefa38bef4adba0e55e174e5f9"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.3/cy-tls-linux-arm64"
      sha256 "c065ddb9c60424614d5a6b29937ca79b55a7f5f85efcbc1347c7c9386740507b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.3/cy-tls-linux-amd64"
      sha256 "7a0f8b43033e7d4367edb7c697dfa48e268d6fcdacd68baf98decea6de843da2"
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
