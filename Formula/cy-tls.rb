class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.20"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.20/cy-tls-darwin-arm64"
      sha256 "2ef9c871320b83642c721bf9e95f5f6ba4096445011e97bbe60adf06856fb3a9"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.20/cy-tls-darwin-amd64"
      sha256 "703e748d456401fb61f30557e4d02a0c74bb555a249be95dc058c95d0dc2c524"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.20/cy-tls-linux-arm64"
      sha256 "cb5947b2252be73e327b707948616b14182e40e76545d848986503a1e884e971"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.20/cy-tls-linux-amd64"
      sha256 "2a9c645b18fff42d8e5ba42839b52444f746a9809101df3c1326a14bbe224cfe"
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
