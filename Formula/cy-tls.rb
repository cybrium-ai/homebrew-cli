class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.43"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.43/cy-tls-darwin-arm64"
      sha256 "1e408efe87ba182fda9dfbba884d7f503f8ce438d6a238438cccbde4a28bedc2"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.43/cy-tls-darwin-amd64"
      sha256 "b0083d0b4fab26e77be244528c71f48939c912b0e935ae2e884e6fdb1710586a"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.43/cy-tls-linux-arm64"
      sha256 "62c8ff5a01682e2884458379d79f90f09322d6b0012261b9d3921dcdbbe6c4ca"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.43/cy-tls-linux-amd64"
      sha256 "81517bc2c6b9d551ba61525849a1e72bba1dcbc0ad900ffcca842a5bd1d52975"
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
