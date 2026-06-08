class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.45"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.45/cy-tls-darwin-arm64"
      sha256 "0ae85f56baa4fea7720eb38813019f5da55155a92c69acc3985fe53565cf331d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.45/cy-tls-darwin-amd64"
      sha256 "92dabf2ccd7d24035907107b03527e70768100fbb47b0d26fdadbc084b2cfb9d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.45/cy-tls-linux-arm64"
      sha256 "dcfda02641207001872fb797c7222b1de38db3a9f5b65459bdc068e5769b4208"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.45/cy-tls-linux-amd64"
      sha256 "9181105e2eb992955e748d1b0b4824e87411b8cbf5746b4d814c07eb6251cdf7"
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
