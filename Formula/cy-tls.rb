class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.3.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.0/cy-tls-darwin-arm64"
      sha256 "b37f39b73a034d53f5efc198cef58bc2677695d8119bdd7949777e34d8ec707b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.0/cy-tls-darwin-amd64"
      sha256 "38d48952438e2914bea9331e3fca7be6a8fcf90c5ee06c3edf08ee4b1bfe0ca9"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.0/cy-tls-linux-arm64"
      sha256 "af8a25e8c28287cabcb8e72518a4c1029bf0ff4d25f21e0ec1b59e85eea36f79"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.0/cy-tls-linux-amd64"
      sha256 "709dae3b95ba7e35ba17ef8514447286bff95c445701bc83d641a5e8bac5a263"
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
