class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.68"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.68/cy-tls-darwin-arm64"
      sha256 "c5475590a3538113a4c0ea463be3213b68e5e2a1e37c473eb0aba06787990235"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.68/cy-tls-darwin-amd64"
      sha256 "49e80b79063a3e063b5d2530439b50e5f7162eb19595ff5297de5320a9f9454e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.68/cy-tls-linux-arm64"
      sha256 "f9a9a48b30676d237846ac75b3a103999eb536c1d14501ab4239bef8f2c1a7f1"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.68/cy-tls-linux-amd64"
      sha256 "bb6790c6029c2d60ddf140177efa19130a8825eb70dd9019e24d08a6db48c0a6"
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
