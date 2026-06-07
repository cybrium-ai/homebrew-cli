class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.36"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.36/cy-tls-darwin-arm64"
      sha256 "d3f05a735138add37846c9ccfb2ad9813d8fd9ff714adb3196abec8083564369"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.36/cy-tls-darwin-amd64"
      sha256 "2c26285aa87b4943b3cd9059341470d3564dc82d2a8ea3bf766e97a3e92647ee"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.36/cy-tls-linux-arm64"
      sha256 "1382fae243ab317e298ed5590863806369c65e3b920500c0f1f8d990bd718126"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.36/cy-tls-linux-amd64"
      sha256 "da80d1554f0c3aa70d017c853d5b44ab83f9fe6e582eab44caa374fd70dad08f"
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
