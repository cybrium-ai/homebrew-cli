class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.9"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.9/cy-tls-darwin-arm64"
      sha256 "f67b6c4fbed85c3687fb22bfd769900fc7884aa653758bf0da412350c4de08bd"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.9/cy-tls-darwin-amd64"
      sha256 "d8c96c9d438bbdf8e4d17b72e2e0a06ecf75bea09310e3e0cd63ca15fdc6da20"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.9/cy-tls-linux-arm64"
      sha256 "d79452c6c849ade3b84cfb9e0a03253408ba821bd31da0607b708f66616f147e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.9/cy-tls-linux-amd64"
      sha256 "ea6fd6dbc4b65fd90ec9bdb219bc24ca93f8196c51d83cb0d2699cf5f51cf87d"
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
