class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.3.5"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.5/cy-tls-darwin-arm64"
      sha256 "46e026b71495984ee6c532c71bcefb29e20bcff6c6d9b24b343a8f4487264ce1"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.5/cy-tls-darwin-amd64"
      sha256 "785b845956c7af3ee44d6437ba2b06babc2055f5342386650dddd71a408d702e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.5/cy-tls-linux-arm64"
      sha256 "38c44444b96e8201593edb400686b712dcf31fce5b5bcbf2e9f7384fd6f3b349"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.5/cy-tls-linux-amd64"
      sha256 "4ca1a9eb77f951139604bfac70d9c040bf6e3729315e8d10947feabcc6cedf54"
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
