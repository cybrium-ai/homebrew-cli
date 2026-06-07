class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.34"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.34/cy-tls-darwin-arm64"
      sha256 "0001dd256d98db09fc648c48e00aa10aff2a6080e0a11d2cf66e7667004e37ac"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.34/cy-tls-darwin-amd64"
      sha256 "0fdde58d619f68e2da9d525028960348e563731d6226dec2f77bea18ba3c06ac"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.34/cy-tls-linux-arm64"
      sha256 "9095e7705dca72c88ec245c4a39ce57153f5b2793bce68afdcd432cd98972fb0"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.34/cy-tls-linux-amd64"
      sha256 "ceacf550e6abc5bfbb73f868d102b779c5fd73cd6a833545c0d3d5cf15ac2a7a"
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
