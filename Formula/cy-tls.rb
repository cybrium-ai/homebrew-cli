class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.48"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.48/cy-tls-darwin-arm64"
      sha256 "ad183c63efa39aea88360bad547a4917b92c4a9751b6419d0a43ce19c5206984"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.48/cy-tls-darwin-amd64"
      sha256 "f336ce722497c0ada3d03effd8051b4211b9ed65ef3e45b1a5a80e4958e2abb4"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.48/cy-tls-linux-arm64"
      sha256 "95d31595661cec72ed1007f708f91a003e6f1799b910918c2a68623154da18c1"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.48/cy-tls-linux-amd64"
      sha256 "1b4eaf08e466b4b1494fee34507514d7eb3748cb47be5830826cf8349624a692"
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
