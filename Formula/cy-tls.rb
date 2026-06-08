class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.50"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.50/cy-tls-darwin-arm64"
      sha256 "e407065fb2ade9a4840a584dc313bbbc480b160e317cf360c64ab11dee60b506"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.50/cy-tls-darwin-amd64"
      sha256 "da4ab2aa5a632fded5f3454a83455d3209075212727f54ea3e308f089d34a038"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.50/cy-tls-linux-arm64"
      sha256 "b08e6e7f18379ac9da0419d456b46de73153c3f3cf998da5bd3f23a71efdce12"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.50/cy-tls-linux-amd64"
      sha256 "c40ef0f5f36ab0c3ade35f3a00138b263351984d8839c2cf105e4ca023c39db4"
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
