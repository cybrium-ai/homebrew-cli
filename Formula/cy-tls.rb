class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.16"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.16/cy-tls-darwin-arm64"
      sha256 "3023c91f747f7b956e7c982a0fd4e9d5cf9976b1e1a6260ce2c15ab38355fd32"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.16/cy-tls-darwin-amd64"
      sha256 "e4086303c6d141f6c200964e53fa33ea57d209ff3a3f42ec0f11cdbfa77cd105"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.16/cy-tls-linux-arm64"
      sha256 "44103773452266fa4a6217d80e5a3108615311809a6fade682c623889af4fb1c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.16/cy-tls-linux-amd64"
      sha256 "b812307fe5a9e464f0db65026b3a648109a5cc4076604c7922d1b51b0781ef6b"
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
