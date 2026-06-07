class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.27"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.27/cy-tls-darwin-arm64"
      sha256 "771ada26694368c13c4377b35edcbf50dcdacc39f0fa8eeda9b1656420313b89"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.27/cy-tls-darwin-amd64"
      sha256 "ce23423cd416fa4f5ecfd5e76f5853e33d8bdd05da8f774722290922a8e9a200"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.27/cy-tls-linux-arm64"
      sha256 "076f63fd7ddec96651a59189d4844ac94bf1800ab580d51db8259f68d29956b3"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.27/cy-tls-linux-amd64"
      sha256 "692c0b6f9259ff260db86b3da94d07abe7d9a0d613759cafaa583128583d049f"
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
