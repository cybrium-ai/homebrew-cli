class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.7"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.7/cy-tls-darwin-arm64"
      sha256 "f37e4564b120968b016c4c9c59e34b92447c9ceb6015361e394568d157ffa8af"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.7/cy-tls-darwin-amd64"
      sha256 "146184363383e4a8b0d3051b1e043351cb80e81e4231e798c368fa46863d7108"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.7/cy-tls-linux-arm64"
      sha256 "77347a10880c3cf36fe0a50422d835bd025837b3687b3070fe9c23af1388458c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.7/cy-tls-linux-amd64"
      sha256 "156ccdd632eabda83acd914b0f7a4b28578a814525515202890a4ab0206bf32b"
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
