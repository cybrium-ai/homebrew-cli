class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.13"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.13/cy-tls-darwin-arm64"
      sha256 "e3c653d54fb37fb5aa6d892b3c125f45608483485eeb65fae6a924658c626c56"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.13/cy-tls-darwin-amd64"
      sha256 "7daa8e0d8f2ae71f78661d49d4dcb1f1ff7655b410d3b41735e9bae988c34d0a"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.13/cy-tls-linux-arm64"
      sha256 "c5eded5e9ab8ce109aa24dff9c0e5eff5928f72a2c10e93ef0f2b217da8a3c61"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.13/cy-tls-linux-amd64"
      sha256 "d5b95ea347c4db6c257b253bcd5c5a08c082499fbd3b96559141c816d1b38725"
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
