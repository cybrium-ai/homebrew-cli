class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.46"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.46/cy-tls-darwin-arm64"
      sha256 "4cff9f1363d6394c2303142bddd5d5d98450be70624eb848edc4aa27c956662a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.46/cy-tls-darwin-amd64"
      sha256 "27f481fe4cf032b641582693d0bc2e45a86ab400904bef37a5e047d2a490fd5e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.46/cy-tls-linux-arm64"
      sha256 "f4401ab89083c93f5a1c930f0e12226509985c07d63b4ea962035fd0a587347c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.46/cy-tls-linux-amd64"
      sha256 "ca6edcc7671d641354a9fc695bbf135eaf0dca5ffe09a71b8227e3071f5676df"
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
