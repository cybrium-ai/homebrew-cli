class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.26"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.26/cy-tls-darwin-arm64"
      sha256 "f1599ea4ca14f4fa3196a3aa7ae36525a9d833fbe2d390d11429296561b1d481"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.26/cy-tls-darwin-amd64"
      sha256 "f83f41706a8f33290da43577d91936e056f6062c47e277f8848353a90842c759"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.26/cy-tls-linux-arm64"
      sha256 "f4d753843894e6221e4525308b4fe91d7f06ebb44e9478eaa1b4f4f15844bb56"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.26/cy-tls-linux-amd64"
      sha256 "3dbafaa512ba76abb27467fed76e6703e7b2d5bfb62f70661879588405c819b2"
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
