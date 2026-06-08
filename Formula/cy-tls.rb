class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.70"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.70/cy-tls-darwin-arm64"
      sha256 "b6a60b44c70ac16a8eef66c7aa12dc7eff0d3869ed2041c65402105404566fd3"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.70/cy-tls-darwin-amd64"
      sha256 "95a9a85d6196b06d3d138b58637a5b91c874b8196b681368df5abcb04dae0899"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.70/cy-tls-linux-arm64"
      sha256 "0244d0fdd5a6a97ccdb46e34f9f2f41f245218e32980cc41a80d264697a2bf4d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.70/cy-tls-linux-amd64"
      sha256 "9d54e14be8354a1298acd0a02c1e0666c5bedc63613e332500b04f8f52642133"
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
