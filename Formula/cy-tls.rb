class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.4"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.4/cy-tls-darwin-arm64"
      sha256 "7f6812e57973a783ae864a8d30fb1ca2895d62d7ea14abd959ce07cbc9520e14"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.4/cy-tls-darwin-amd64"
      sha256 "f17fe9f20fd01dc4daf01175e39260da46f0e98b6b982fbe6ac9e24aed33a60b"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.4/cy-tls-linux-arm64"
      sha256 "328a92d88766713c0423893c3fa325514b6c33182ade6117f01dde8790ee454f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.4/cy-tls-linux-amd64"
      sha256 "f1141bda723a293eef6f2e5bc5e24d940d86ac6048c9059c95d64a5a663ae565"
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
