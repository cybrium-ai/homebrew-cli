class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.9"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.9/cy-tls-darwin-arm64"
      sha256 "4916b05675e64e1fcbbc21e89bd26330b70ace119ed2fbfc7475cb664f8cd645"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.9/cy-tls-darwin-amd64"
      sha256 "0b483ab7ad8c38df874921b9a44175e7c75c5a5326ccb6dd8871c8884210eaf4"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.9/cy-tls-linux-arm64"
      sha256 "380e898f5001344783c062e083c2cdc74d7040974de083fcde15d1e488632d77"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.9/cy-tls-linux-amd64"
      sha256 "060daeb104a2f5af91bc7f8be6653e46573f321a2ddaa5a5bc1a22964eac656a"
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
