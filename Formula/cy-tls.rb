class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.3.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.2/cy-tls-darwin-arm64"
      sha256 "d0d92054643ad6af12b3ca8b075999a678073e63411fc4bc6bf6780b6d56f61a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.2/cy-tls-darwin-amd64"
      sha256 "6d2c18131591e7ea58dc949c25a96631cda77e39f837571c4f6d5cddbf96f07e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.2/cy-tls-linux-arm64"
      sha256 "370d57a7ea9bfa02d7d0539a3b1c8705174e9bf8bc4136eb628d4b519430d9de"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.2/cy-tls-linux-amd64"
      sha256 "b2e580110522dc1e98ccbc48a420d55da8f2de3967420b7830c482cb1ce81157"
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
