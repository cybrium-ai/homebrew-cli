class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.54"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.54/cy-tls-darwin-arm64"
      sha256 "e4661aa019068faf4086fc40981c725e64775b17945910a34f4bdab08edf41f1"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.54/cy-tls-darwin-amd64"
      sha256 "eeaa42d7c6579a510b1ce2f70108f4eb8eb1e91978044ada87876e282ba0db40"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.54/cy-tls-linux-arm64"
      sha256 "baf39a4a7cb1c938ed2b1a2b55961a85723f7a889336d83fc72c624015638360"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.54/cy-tls-linux-amd64"
      sha256 "30794e620746c5495a4891f9e2e4f2a6a343d663370436dfebf0682efef61c69"
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
