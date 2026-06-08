class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.67"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.67/cy-tls-darwin-arm64"
      sha256 "08b842536de650f3ecdce7b41b0cdb6accde622f552cf6ed4b9440446722a702"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.67/cy-tls-darwin-amd64"
      sha256 "be4b54cb63014a556207b01d686dd2639b10902017a6f7da4c3a16c22ca84ff0"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.67/cy-tls-linux-arm64"
      sha256 "1624f876e426250cb3e339c77da9580b80c0109a7dcb2507c5818225f1ff170e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.67/cy-tls-linux-amd64"
      sha256 "559ccaaec654237c486e21a8194d546eb69fa849d6156fa49679d8f67d2c83e8"
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
