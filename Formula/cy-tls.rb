class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.63"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.63/cy-tls-darwin-arm64"
      sha256 "d9125cddbaae3ef1aced6ddb8ffac536ef135dd08be314d620985b9784a895a4"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.63/cy-tls-darwin-amd64"
      sha256 "334b26e0c0af0c695a1322cfdfe72770c20273ef364033ad1b81717daa915857"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.63/cy-tls-linux-arm64"
      sha256 "74de2bd34b5f18c35669e0a2687d8b6521c7865d66cbc9939d73f969e9749e9d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.63/cy-tls-linux-amd64"
      sha256 "a6727c5e9ddef600a8ff117e0040add59109104e2511c669e559090792f68811"
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
