class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.19"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.19/cy-tls-darwin-arm64"
      sha256 "4e27ec639033c4f28643bc448198f83be7f161835a190fb8a4be63d237a10f9e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.19/cy-tls-darwin-amd64"
      sha256 "7e342a69b61b343b7099fcf609093b291e88bdae2fb851c70ffa2184e99b907d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.19/cy-tls-linux-arm64"
      sha256 "3681be5b004a8efdbc2e527621986e4e4656f6c324d6b264fb99f12dd64d04dc"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.19/cy-tls-linux-amd64"
      sha256 "ad28838118960a5c492586fe28b2ecce2e1603bbfa42151c8acfa6ef6e8b58e2"
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
