class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.60"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.60/cy-tls-darwin-arm64"
      sha256 "49d78a933c4c74c0b71ebcd52b861973079767c79593acd209c233a4aadce324"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.60/cy-tls-darwin-amd64"
      sha256 "4cd132155f895f0dad5b4a8a1036fec0c39e9b4d0b37668f61f84a0441c1493c"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.60/cy-tls-linux-arm64"
      sha256 "fe9004b802724a03fb4ac095992da43cff1ef3bf610a07946ef668f827afcf3e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.60/cy-tls-linux-amd64"
      sha256 "4d2da038073c791e4396002c9424f0b69bcdecd58a884b39c39ed05fd47e8505"
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
