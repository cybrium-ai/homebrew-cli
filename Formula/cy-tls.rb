class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.3.4"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.4/cy-tls-darwin-arm64"
      sha256 "ecfecc6042a6beaf65bb40d7e6b87c81e391b34f01d20ac9fc35df7f66423d82"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.4/cy-tls-darwin-amd64"
      sha256 "20859a4d1472c58860568c6a09e4e51781107f938ba15843a178ea49eef7ffda"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.4/cy-tls-linux-arm64"
      sha256 "470f7e222354893be5fbffd6cb9a4be733dd2cc1d3d8abe6f946c0b016c68d69"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.4/cy-tls-linux-amd64"
      sha256 "a15243babfe0963a75b0f70c767500845093d9f87757c1beb6845eb2651fed6c"
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
