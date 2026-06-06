class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.7"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.7/cy-tls-darwin-arm64"
      sha256 "4caf1d45c1ad191d44595fc10519e744a2564c36a12147ec6066a437f1ea1773"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.7/cy-tls-darwin-amd64"
      sha256 "57b52a3e4a642c5d0d674693a2025e2173734ce83b764fb6df7c0baf5eb02135"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.7/cy-tls-linux-arm64"
      sha256 "b075ce2033242153b564a115d9e33e1064a6a1ceb63f447c8b5ae14f578ee7d3"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.7/cy-tls-linux-amd64"
      sha256 "674fbdea075900cca44c5f54ad5e0c29d6015fddd43df7db6a24fa6c726c6e7e"
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
