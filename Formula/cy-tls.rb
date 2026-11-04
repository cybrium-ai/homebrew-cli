class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.6.7"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.7/cy-tls-darwin-arm64"
      sha256 "ae8000639981afee8521296372ecd704d16dac943f50ffa9cbb625429bcced2e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.7/cy-tls-darwin-amd64"
      sha256 "a8fa9eaa6ad16b09782edc4b23f3bab6c0b8c35d5bb95f8dd3bcb527b4517556"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.7/cy-tls-linux-arm64"
      sha256 "bfc8c8b9a94f69037d15bfc3a8c7eedc9bbe302a52226334922ed8b685fad8b5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.7/cy-tls-linux-amd64"
      sha256 "654e1ec6d8ae98ced0e91ea3b34663d80a7d7afec0e4ebdb69a8ad8432ff9574"
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
