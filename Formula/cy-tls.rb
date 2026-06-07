class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.21"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.21/cy-tls-darwin-arm64"
      sha256 "1e0105a812bcf99cfa9f00f4f12c9c3a45cbc5a324cac19f493a2db32dba2797"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.21/cy-tls-darwin-amd64"
      sha256 "1316a82e81abb36783e8836850c0edd79a9beb90ef88878541fba9772ad64fb1"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.21/cy-tls-linux-arm64"
      sha256 "2c22dae5b0f2de43ddc7e980284d35e9795741daf08fc1c94f346d467f180852"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.21/cy-tls-linux-amd64"
      sha256 "6de458e4ffc37f493b5caf502db431019ba72b086ad281cb39b53a3b47de4ad3"
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
