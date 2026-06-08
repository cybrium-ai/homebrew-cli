class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.71"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.71/cy-tls-darwin-arm64"
      sha256 "3eeabfcbcc37e22ed6c9a40af71a3b0b6db37f94b11992336ccd83350a5828d4"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.71/cy-tls-darwin-amd64"
      sha256 "95a520cef58e72f459a1de4405c5275f4d17d36833ebbf8ad273b810f917ae34"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.71/cy-tls-linux-arm64"
      sha256 "db99b33126d7e64a2ea6564bdf0f7415864996b7b118b1fe77ef3b4f211a2edb"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.71/cy-tls-linux-amd64"
      sha256 "596aba8d312ee5ac8f8f4abc02af558ee676496c8b3840598ab87a6470e4c326"
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
