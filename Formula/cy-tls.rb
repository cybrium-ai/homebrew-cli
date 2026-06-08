class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.41"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.41/cy-tls-darwin-arm64"
      sha256 "29e5c405836d5fa003ff4a3cbe9e351202d1a9399da0ca06c374fc27b62be9d5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.41/cy-tls-darwin-amd64"
      sha256 "6d4d427b72ab55676afa6d7117cac138fd9d917ad42935114f2f61f596b763e5"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.41/cy-tls-linux-arm64"
      sha256 "40a876f084b1e0adb769a0062c2c2e58efae9c15ebee979c5e577a357bcf4367"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.41/cy-tls-linux-amd64"
      sha256 "831af8ab103458d3b537b0c85903b60f107a161705913e083fa55ba3a366e427"
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
