class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.4.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.0/cy-tls-darwin-arm64"
      sha256 "2be08ac275c54af31c93c898d3843ec073bc522d00aded21685b12a56a8a6642"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.0/cy-tls-darwin-amd64"
      sha256 "205651705c5200196552c82d159572581fa467f1676f06e7350f477cfcbdd0d9"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.0/cy-tls-linux-arm64"
      sha256 "8df3d6ebedf378e348bbc7a08818aae0babdebb3cd42d01d3b1fea8e0cb3d437"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.0/cy-tls-linux-amd64"
      sha256 "c003c36aa6209ccf706eca7f7709622d178021aabb5d7f213b1c5ba171f5eba2"
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
