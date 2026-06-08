class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.49"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.49/cy-tls-darwin-arm64"
      sha256 "6cd47b4d872c7446731a7113bfacdfc912bf5804eff9fea16be84644c2a48f08"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.49/cy-tls-darwin-amd64"
      sha256 "cacb6e1765ca3e66b873c5b63caf334cac03b0190d07cb40fbb60a70d19cb0e4"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.49/cy-tls-linux-arm64"
      sha256 "bb33556ea77565eca7a604b79df7a7e0f7616cb94a357f1984424afc1803c01f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.49/cy-tls-linux-amd64"
      sha256 "690098dd69399f48877b46c38dea1615f249697cee82207cdaa595670a9b9ff2"
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
