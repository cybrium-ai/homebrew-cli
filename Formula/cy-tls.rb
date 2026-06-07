class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.1/cy-tls-darwin-arm64"
      sha256 "c0868efd22942c7a4bd67dfaf828a02ffc9a63bc4827192da25006da4abcdeef"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.1/cy-tls-darwin-amd64"
      sha256 "b492e5b1bd00766d0a117bda9ca8a1c99cb4e12a6ee79d1ef3fb7a8d9fea75cd"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.1/cy-tls-linux-arm64"
      sha256 "0dad3225ed9886c43963d4c6d022efbb4ef6eef55091f0a57080d5d7b1d81d36"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.1/cy-tls-linux-amd64"
      sha256 "c5789a6aa6ef30041bbdfe9954f349f25d07f29600c95413d96006524626c4e8"
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
