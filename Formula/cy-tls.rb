class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.18"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.18/cy-tls-darwin-arm64"
      sha256 "727c697eec20cebca9d75f3801fbb71f8f3e49d09acf75664b6ceeb70917ee37"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.18/cy-tls-darwin-amd64"
      sha256 "0c5ca12d2058af05b4d8ad4dc0c9de9e74b3a3eb6fe7f57ec6a43e482083a3d6"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.18/cy-tls-linux-arm64"
      sha256 "2e47ecc969dbb01e1516fed55e4a6198f698bcb2241d3e7247e23421d5ee53e2"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.18/cy-tls-linux-amd64"
      sha256 "ed10713fae5c6b871469b1cee2e631e93ac747aaa40ad0c2c1ab7adb0d4d390e"
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
