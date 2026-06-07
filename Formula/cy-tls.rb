class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.30"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.30/cy-tls-darwin-arm64"
      sha256 "d64aef45ce3a78896b803e27a7869ba7d617d598e2b04dae1036403e78ec3e0c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.30/cy-tls-darwin-amd64"
      sha256 "44845e3ff4fcfcd84540894f4177c023a9226474649bf7089e7332f4449f2272"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.30/cy-tls-linux-arm64"
      sha256 "be0be332b1cb545c9922f590f380f6bfce74ea9761bbc6b2658179072154dd6b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.30/cy-tls-linux-amd64"
      sha256 "9912ba0819d036e0e7dacb2220ab3b25317daca09b095ac28c78c14a74c4c00d"
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
