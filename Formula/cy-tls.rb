class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.39"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.39/cy-tls-darwin-arm64"
      sha256 "a1e5517c9ec1a7ae4e39fe57de988ec3cbe2fef39512a8e8dd027c4f6ea3533b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.39/cy-tls-darwin-amd64"
      sha256 "b8974a355611dfa50299098a488e0fb9df88f70d40710ea24a6019847b63e551"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.39/cy-tls-linux-arm64"
      sha256 "195112cb31b8a1bd88b208048b5e6010a41892bd9b9998a09736bc6e7fd5b30c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.39/cy-tls-linux-amd64"
      sha256 "345f8a70f2a853d04debbe162c0c27cd190c937daf5ec6abddcc46d52fb80b16"
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
