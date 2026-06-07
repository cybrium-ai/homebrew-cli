class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.11"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.11/cy-tls-darwin-arm64"
      sha256 "343da989a3152307334983d725c9a3fd2eb6dcb9383b4773bd24ddca9ad50caa"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.11/cy-tls-darwin-amd64"
      sha256 "0b3d88da52a2651245c56fbf9fd27c058952a25edefc77b144cde40bb77975e3"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.11/cy-tls-linux-arm64"
      sha256 "2d29cac69c338f5e7a77566b2077463044e111cb58fe84e95b829e0069346b11"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.11/cy-tls-linux-amd64"
      sha256 "c8b2116ad9e270d036efbca81a63a41b8c58d5d0d6a67d830fc031f8c6dd0aa1"
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
