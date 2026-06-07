class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.24"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.24/cy-tls-darwin-arm64"
      sha256 "e1e3695eaafe5b67004e0d9ee5294b1ee5990caf587de007b1e8947907855885"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.24/cy-tls-darwin-amd64"
      sha256 "61add742633ec252ca767c35b0e0fdeb41ab3deef6a958a17eb99337b0271f95"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.24/cy-tls-linux-arm64"
      sha256 "181364d9e7861f6ea10db01712359f73eadbce3b541749df1778f7807b810188"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.24/cy-tls-linux-amd64"
      sha256 "5789218928996eef282749c7d6f2814ea58f634d69ad16cd9646391f40b7a3b9"
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
