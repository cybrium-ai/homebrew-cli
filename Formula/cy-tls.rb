class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.17"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.17/cy-tls-darwin-arm64"
      sha256 "dafba63ba7f441b17a61be6dc60c9133f7706e521aa0e4122620126ddf6b730b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.17/cy-tls-darwin-amd64"
      sha256 "82dfe2ac25dd89d3b0b84b30f7c15640f927d19514bf75f885175169fa51830a"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.17/cy-tls-linux-arm64"
      sha256 "51fd84c7a45cea45a992667e66b137cfa75ade2a74423cada236ad7da3d0e094"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.17/cy-tls-linux-amd64"
      sha256 "ccc0d30bb47c4e199f616b6519971a879975ac509cb2bfc0fe12c3c8fee981db"
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
