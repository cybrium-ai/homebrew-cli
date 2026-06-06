class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.15"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.15/cy-tls-darwin-arm64"
      sha256 "23cc7af401f76b8946413b23e28d9723a62447603bb3810443ad69f603e0608c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.15/cy-tls-darwin-amd64"
      sha256 "1301a4bcc15ec7381225de6581b5ec47aa5ea21096d1e9994e7d7a2f51766f47"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.15/cy-tls-linux-arm64"
      sha256 "3b341d4a8306ce81b8ca27e96101da58967df9d10772151a415339811ad4061d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.15/cy-tls-linux-amd64"
      sha256 "ada66405a5ec465673516543ee7391416b62bb25150bd9954c3b85544edfe107"
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
