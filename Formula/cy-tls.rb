class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.25"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.25/cy-tls-darwin-arm64"
      sha256 "03f60b22f66508e9d4c70878e3bb8e8bd971787b05b423e8cd9f80b66c228481"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.25/cy-tls-darwin-amd64"
      sha256 "b4560687de051a3cbd14fdc9cc4f0db4c900ef4142a6c8265428f4bba27a3fc0"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.25/cy-tls-linux-arm64"
      sha256 "c2241aa41653a62902bcafe7c360d3050a982092d1c65420f646b11e847abff5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.25/cy-tls-linux-amd64"
      sha256 "0de22b2fef2b6f97587157d5e1b66346dcd8ac540b9086e9ae4a3dd291928e46"
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
