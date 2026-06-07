class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.19"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.19/cy-tls-darwin-arm64"
      sha256 "1e07541602056214bb7716dfbfc5af55d0cd41c2be3a12c631c9b2fa985f279e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.19/cy-tls-darwin-amd64"
      sha256 "da725a714daf22807b68995e0384ccbac5f235d817763fc901d93ebcfd85cf21"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.19/cy-tls-linux-arm64"
      sha256 "cfd4be57e8dde55abef14a8018c80a61809417da36dbafa586618c6d57961308"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.19/cy-tls-linux-amd64"
      sha256 "d25686231e8280a7e42b19848a7d18dc2b685d3c6ad64732b48619d603e74fcd"
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
