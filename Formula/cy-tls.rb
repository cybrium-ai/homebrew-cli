class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.59"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.59/cy-tls-darwin-arm64"
      sha256 "f75d5876aaad509eda589d807e8dd49f3b7822b2f96ea203f111d41ea5921214"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.59/cy-tls-darwin-amd64"
      sha256 "34e080ef47af5fe01cafd9e2b544dc9f263f4dc5cb6a62b0f7860df2794f29cb"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.59/cy-tls-linux-arm64"
      sha256 "9b23c25087e6184c234f7274fa4359fad84ce8b812ce2033c23e913112307e00"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.59/cy-tls-linux-amd64"
      sha256 "96c3b6dfbfbf37a352f695c691faa130de3104ce130162425c9a9f60a177b72c"
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
