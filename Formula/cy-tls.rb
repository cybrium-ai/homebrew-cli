class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.38"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.38/cy-tls-darwin-arm64"
      sha256 "0ef50233195dc6e3a781744f96b1c062ace4e8cfdfb85f1d4a480bb9fa3b4cb0"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.38/cy-tls-darwin-amd64"
      sha256 "103cc755a7990cb8d3d5c9bc04dfece658749f1c3b0f721637be2c6f07d6e03e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.38/cy-tls-linux-arm64"
      sha256 "6d82f636553c0b9f5d412f84bd545ee69f243416f149f16b11f188ec65ad3276"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.38/cy-tls-linux-amd64"
      sha256 "7fe8490673916eae7dd930c2a6c0715fda57897a817d70f10251cf6ec64de0b9"
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
