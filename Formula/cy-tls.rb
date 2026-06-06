class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.12"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.12/cy-tls-darwin-arm64"
      sha256 "3d55226d52f0eb7b4831af255141faabe569201c5166f388f6f342c681e22454"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.12/cy-tls-darwin-amd64"
      sha256 "e9f91f0e4faf61d6b5c987c9c8aca41ff00317f8e4294ca00aa48a5d8c828758"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.12/cy-tls-linux-arm64"
      sha256 "cbfe461d64be58095963dad020941eff00e3b1500b3cf22432f7ab2f3b69dea1"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.12/cy-tls-linux-amd64"
      sha256 "6492cae532992ea158eac1e1a0069c1d1f1317e891bef31fc302390aaa99b840"
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
