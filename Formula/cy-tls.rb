class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.10"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.10/cy-tls-darwin-arm64"
      sha256 "e026b54fc1fda5190d0301b3e97a57e8ca17bfd16e9a35855aa4f5444650a164"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.10/cy-tls-darwin-amd64"
      sha256 "fe5dd8253996744d790ec4ed59efccc15f576cc05008048df7b019a56f19c075"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.10/cy-tls-linux-arm64"
      sha256 "d76603142ac53022c5dcf0885c2b60932f17e9d1333b3912a8a76cd402a52949"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.10/cy-tls-linux-amd64"
      sha256 "5fdda22f9ea11d57b4215467883b7fb283400582bf4f9a56ad313cecbd8ef1d4"
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
