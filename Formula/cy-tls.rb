class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.17"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.17/cy-tls-darwin-arm64"
      sha256 "9fc126fdc2753a10ae5f884c46c6e36bbb8ca7ad479416cbc6f92cb5d711ec92"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.17/cy-tls-darwin-amd64"
      sha256 "221b3118180320eb1b0389eeae951a735fa7623d3aecdf38f609422fabeac578"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.17/cy-tls-linux-arm64"
      sha256 "3adbe0f37cafa26b41e5363f1aa8fe5cfbf69bb320f492ed637158e13a4603e3"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.17/cy-tls-linux-amd64"
      sha256 "6792723ab05cd71c381e7f66e8d477907a9425dc83636ec1435c5523200df608"
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
