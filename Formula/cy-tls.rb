class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.37"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.37/cy-tls-darwin-arm64"
      sha256 "66efe9b11b419d82190e39cd2994577f9252abbb65de872591d20693ccbf094d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.37/cy-tls-darwin-amd64"
      sha256 "9a51bcb9bc31b7281b6680448bb2bf7e0bd0e281c85bea2d310098a4e12b0e85"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.37/cy-tls-linux-arm64"
      sha256 "3d4632d2ce7c4e855f5a5223689eb51626cabe360e9ca74e25c655ab661e133e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.37/cy-tls-linux-amd64"
      sha256 "5fb7e8c26387686bc6eb5e77c1b050bda2c4cd72f321a4e1b2baa72e413f19fd"
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
