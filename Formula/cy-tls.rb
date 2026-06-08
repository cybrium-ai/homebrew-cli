class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.72"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.72/cy-tls-darwin-arm64"
      sha256 "e4e9a8b8a992d48989856153a2e4a2ad211f995c9182ba5a64defd2386323179"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.72/cy-tls-darwin-amd64"
      sha256 "59ae158046fd45d22ccf92af18f12a6e6ebf5ec2533ac6028bcbfdbeae4d8d86"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.72/cy-tls-linux-arm64"
      sha256 "0e5a1723262d048af3e1a72e33ac9dfa405d0e72e622289211cafab302cdc4d7"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.72/cy-tls-linux-amd64"
      sha256 "c639a8c09a81f4adb6737e675ba4ab29fac1b4919ac791d120b5bafa8a95a898"
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
