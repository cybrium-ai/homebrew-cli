class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.57"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.57/cy-tls-darwin-arm64"
      sha256 "7d9e1ac76372fd15a866936ec22af2d8cb96c6fbba3b7c5344e83d3803be3320"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.57/cy-tls-darwin-amd64"
      sha256 "de2f2f0f34c7777b39c5b2c8ec098b5d54a44eb526e6393186a4f6a7554862c4"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.57/cy-tls-linux-arm64"
      sha256 "2eb874a85c1e59ceb50efdbd31ccf90566384f80b8b7388bb74e3deff36a648d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.57/cy-tls-linux-amd64"
      sha256 "af58f329a6a7ab183bbeeaebbe91c052f54d4288ee9e3bda6584059dd68977ec"
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
