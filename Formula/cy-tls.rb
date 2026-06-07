class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.3.3"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.3/cy-tls-darwin-arm64"
      sha256 "a40ef38380a7516899ce024b6c67f291bd54fbced2ddc97598d471fa1ad99071"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.3/cy-tls-darwin-amd64"
      sha256 "d16af229eb4deb2dde3a3a3908ced29acb2252216cebba5329e1e76fa49fe13a"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.3/cy-tls-linux-arm64"
      sha256 "6db95a0ad82758a009b9f0f9575458261dd943c762cff0c84b80c2d9cb874dfe"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.3/cy-tls-linux-amd64"
      sha256 "3c9344c5b5cd5cf8001c48b4d584fda8bd2eca331674a3ebcd50721874368849"
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
