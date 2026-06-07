class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.2/cy-tls-darwin-arm64"
      sha256 "64ca0410d03f6a32266835a3304a701edef0ea43d59816e0dca64b5b434169ff"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.2/cy-tls-darwin-amd64"
      sha256 "a82152096fc1d7fbf568a9431d5f09cd4fed35e6332c7765a5ccf8a9d0d94e2e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.2/cy-tls-linux-arm64"
      sha256 "000001dea134eb0838e99313244115beb86e2b9aec13aff333a26f834401c5a4"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.2/cy-tls-linux-amd64"
      sha256 "60dc0c3afbc6ac9533281eee80345d749c118e0a4f1522a1245b1034caaeb02f"
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
