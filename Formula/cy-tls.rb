class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.6.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.2/cy-tls-darwin-arm64"
      sha256 "9a2a27a893d4aa2290f852d5048010550b7ea3a277d3c6bd81c366e9af307dcf"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.2/cy-tls-darwin-amd64"
      sha256 "35bc5b07261e4df3cca2f6a55af295c6fb51f48d05d94e89c41f9b45bdf9cd11"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.2/cy-tls-linux-arm64"
      sha256 "8f4991d60ac77c8f8caf3db51b160a7425ee582cfbff1a428ccff4266c1d881f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.2/cy-tls-linux-amd64"
      sha256 "218767a0b4fddc9b304dbbfd3696b3ad99304ebe7e0922db860ba449632bc6ad"
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
