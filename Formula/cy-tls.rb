class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.1.0/cy-tls-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "a6a7395d642d44a2df2c24c76f42a72c6b870620c34ff4a5abd8f7158aa9c28f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.1.0/cy-tls-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "e099a4c11e73ca75f3ddbef8dd1d1d2abaa712e078b43162331a912e0b24bc6c"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.1.0/cy-tls-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2f1231c021b22e8435b1ae8506e72112c63834137360ed82ef284151d8d70ba"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.1.0/cy-tls-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf41bbf8a8beb277efa9654ec9c91527cc6ca56866c890571324fa8be65e4315"
    end
  end

  def install
    bin.install "cy-tls"
  end

  test do
    assert_match "cy-tls", shell_output("#{bin}/cy-tls --version")
  end
end
