class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.64"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.64/cy-tls-darwin-arm64"
      sha256 "2f3cf13effb7b31e03b70773bb9ea9d605f42fd6016359a2b266b90ca1f70cb4"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.64/cy-tls-darwin-amd64"
      sha256 "078ffded09876eaf23569d2828a7bd92a2d364c9cf2ef42486f60e64b415ebca"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.64/cy-tls-linux-arm64"
      sha256 "7cc2aa4daeb4aab46d87de885032882d9ea9525522527814798402b86350472c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.64/cy-tls-linux-amd64"
      sha256 "aeba1bd8458e8d22be24964dc6282cc125aca152de63321934fb7a555a6f6796"
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
