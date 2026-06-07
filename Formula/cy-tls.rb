class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.8"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.8/cy-tls-darwin-arm64"
      sha256 "148b4b0fdde0b562892c59988f1ba06265c7d1230bcb3d134084eac04af10e94"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.8/cy-tls-darwin-amd64"
      sha256 "0a73d0cca3045faa05c70d5782fbe21e0117427e4af75b61b8ae01fb786037c0"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.8/cy-tls-linux-arm64"
      sha256 "26f2f49ad1881a09c484ebe9b21e8645fad496ac9e6a1b29f7332b29ece6c53e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.8/cy-tls-linux-amd64"
      sha256 "ea6d4aad02c245eabe935aa3560d4a06bc88044b0d394d61966e3dc685b3e306"
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
