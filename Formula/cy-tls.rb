class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.3.6"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.6/cy-tls-darwin-arm64"
      sha256 "68bac8719f67fb3c9d850608a5c35663e9bb0e7035f71c289c1f37ad736b50ab"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.6/cy-tls-darwin-amd64"
      sha256 "078e0fc2d71812e5339a13aa45380b0b85cc48c4a550dcac5c51ef82a82f6f84"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.6/cy-tls-linux-arm64"
      sha256 "7adce15a65aca97b4f9cbf9ea1e21aebfc9924527a56533f5a964d43ded1d7b2"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.6/cy-tls-linux-amd64"
      sha256 "bb4603a39ccf7ac6ed68c8d1ea679d50651baf8f7e2841c60c6465bdf2d19db2"
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
