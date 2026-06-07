class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.14"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.14/cy-tls-darwin-arm64"
      sha256 "4ac2fb0cc8228e86f0d15af2009220791307ea02e51a443346d6b262c0953ad6"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.14/cy-tls-darwin-amd64"
      sha256 "45ffb2044001dc1caeaa09b55215d37024df64b06a3f5c3396f3efc5a1b53da2"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.14/cy-tls-linux-arm64"
      sha256 "3829143cd975115d2aedb1fe883d58bcf0740e7e39581885028746b5696b8dc2"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.14/cy-tls-linux-amd64"
      sha256 "9df2126c08bd8d3ace194be0ea626feff7bd1bfcf8732546f9a6b7ee1c19bf83"
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
