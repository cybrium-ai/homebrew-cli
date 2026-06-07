class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.6"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.6/cy-tls-darwin-arm64"
      sha256 "462a77ae18d05a421cafcb5f87d535e031690aa3a44d8500bd27453178462785"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.6/cy-tls-darwin-amd64"
      sha256 "f1de686232a43f85eb20085e61a80ab130f7beb81942575ac9b814ff615dffa0"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.6/cy-tls-linux-arm64"
      sha256 "c168012f7ed1851247bd1ee1581078ed3c7346ff32cf22967d48938a6c65a99e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.6/cy-tls-linux-amd64"
      sha256 "00f14361944b2ba17233781f54a44cb15139d940d701b09b9a8ab62d11993094"
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
