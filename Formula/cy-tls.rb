class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.31"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.31/cy-tls-darwin-arm64"
      sha256 "09153a9ce35a38416c386d2438f0389fcd442a9ae145f4ef1f6193e35448f58c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.31/cy-tls-darwin-amd64"
      sha256 "fb8fea7ddf847474497b76f719f18cdc4c3e08f9f79d5d118c246aa639b1dee8"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.31/cy-tls-linux-arm64"
      sha256 "38fc452ec0d012e49b139501e665988a0b008c64568b925dad2ecec068a8a584"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.31/cy-tls-linux-amd64"
      sha256 "c9001e865e0ff77fd689de782a017bfdc3c0d666629fc5526e815ab0e6120213"
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
