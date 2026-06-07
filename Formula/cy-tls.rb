class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.29"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.29/cy-tls-darwin-arm64"
      sha256 "1e9be674823a0ce65be640d7d8372e8578da0995376ceed8f5086bff5c535dda"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.29/cy-tls-darwin-amd64"
      sha256 "7715013b06f11288f79adc8ae214f6532f6be1bab79498112311982bf98f85ac"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.29/cy-tls-linux-arm64"
      sha256 "e8feba062a429c85d4ebe882e23c4250ce2ed24356a359ca9931e095c80316e4"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.29/cy-tls-linux-amd64"
      sha256 "82caa5a915056936e01553ad611621dbab63d23643c20f939b91b29bec7757b7"
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
