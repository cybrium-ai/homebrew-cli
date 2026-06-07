class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.0/cy-tls-darwin-arm64"
      sha256 "61b2e506f0e7c0791c79a8d9cbe696a7ed4a331fca66f3bb226acc5c41276d2d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.0/cy-tls-darwin-amd64"
      sha256 "5703baaf250e9b2d3cd092f853ea2006649bf0e1ab3dc349e84626a1abed8a22"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.0/cy-tls-linux-arm64"
      sha256 "e929364e13c2a94a8861e75093b1a7136c1183c8432dce109adbcac0a30ac311"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.0/cy-tls-linux-amd64"
      sha256 "7d6c4e881cc86c1dce58d4a9d8833009ccb07a90f46ca0ac0aa9c0c49f22c834"
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
