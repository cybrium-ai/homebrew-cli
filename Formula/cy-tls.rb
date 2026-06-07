class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.33"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.33/cy-tls-darwin-arm64"
      sha256 "1f136603bdcb4b52dd8b03bee5fcf6b978c5e4675b70e6a41b30dfae9a382071"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.33/cy-tls-darwin-amd64"
      sha256 "a3f43197faf894cca9001a63dcdce091a55968c7c5878866ee81250942518f56"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.33/cy-tls-linux-arm64"
      sha256 "fc0893823d2387e88b86765d173b607a259d940d374a43ae08ff29ef545da85a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.33/cy-tls-linux-amd64"
      sha256 "901007d250b7f3de1977e144e966fa485ef1c8fc56b5b01ec11c4c202634054a"
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
