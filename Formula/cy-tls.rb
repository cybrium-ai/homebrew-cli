class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.6.6"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.6/cy-tls-darwin-arm64"
      sha256 "2d40738e0bf4054a79c1e76810e11ad4f9b43f6f51aa15e27d90abf338b7f2a7"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.6/cy-tls-darwin-amd64"
      sha256 "b06cdbf6f5f4428ca20850ed668f9f1c8835db788d3d61577bfae9fb2c571cb1"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.6/cy-tls-linux-arm64"
      sha256 "7a69444be94c7ce552a06c43d1a5b16383177998ea7b7dfd00016057ed023e74"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.6/cy-tls-linux-amd64"
      sha256 "a48e83c48e055dce792b139a02a40fcf15cd6ade7ad3df800a3f9af88826a15e"
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
