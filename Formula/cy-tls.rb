class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.4.5"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.5/cy-tls-darwin-arm64"
      sha256 "72febbd2e53f431ca0c66788e8a6a6c0ce0b9853f6b8b14e1e3c42eae26da923"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.5/cy-tls-darwin-amd64"
      sha256 "852ac6276cb5a55812c70f87b2a1e332f8c7859631c6647972e6221cd53cb6a1"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.5/cy-tls-linux-arm64"
      sha256 "2f4dffc5a4aac366d89036e242b04d580c969899e67f4be433529a229658d81b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.5/cy-tls-linux-amd64"
      sha256 "99de59355cb766456c9cae787fc35d7b319790bdd91f0d34af26905043472f56"
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
