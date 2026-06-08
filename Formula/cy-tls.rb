class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.56"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.56/cy-tls-darwin-arm64"
      sha256 "c5917fb2d2d27f0c4df96da98c8c1c37ee91658d106b41d8ff2eaca2f8155223"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.56/cy-tls-darwin-amd64"
      sha256 "6e7dc52bcf687fc091ae06cf65550e8d8fd8785ccfb775e69dd6547165c96648"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.56/cy-tls-linux-arm64"
      sha256 "be7e05b700078c7a1a0e0645d9aafc66aa3b4f2ba8d63b0a71ddf2b5f3fe3428"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.56/cy-tls-linux-amd64"
      sha256 "8de733dace2356b6e72f2022787a1332b6f80c56d871192d7b3e7a0c2def8272"
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
