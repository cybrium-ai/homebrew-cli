class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.3"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.3/cy-tls-darwin-arm64"
      sha256 "17e588f6df07af99adbf8957957de0cf277b6679820060af1f4a6973c1b558a3"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.3/cy-tls-darwin-amd64"
      sha256 "60170b7a4ad8bfec1a514708d606a43975aa1573999b5e1ecf7cb15e48199def"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.3/cy-tls-linux-arm64"
      sha256 "a76911f0af473264cbc0748c7c66ed68b022243fc6c677772b1d8cfb7c58b8dd"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.3/cy-tls-linux-amd64"
      sha256 "840239e61564830281886897e353c12f81ef4b691896f4791b04182698b3ae08"
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
