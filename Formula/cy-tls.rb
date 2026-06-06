class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.13"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.13/cy-tls-darwin-arm64"
      sha256 "b1d2acec442ae3b55c681e7a529bfff758de8f16361a036c579bee3b1608d745"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.13/cy-tls-darwin-amd64"
      sha256 "6e83f8ae3c8c4e6b8e69668ba9429429b7795f992363bdaad503a1ae69062e31"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.13/cy-tls-linux-arm64"
      sha256 "780f87ad7a694eca46aed86ee4c5f3d50fbd6f4c83466a6c413f47d5608e3b89"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.13/cy-tls-linux-amd64"
      sha256 "bf93d34082c879a5c751e4735324760d605539995bbb2872f1eafb539097df2e"
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
