class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.23"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.23/cy-tls-darwin-arm64"
      sha256 "efc71240e20367978644ddd541ef8496d15f55e821e4cf9087ddf404e9895d85"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.23/cy-tls-darwin-amd64"
      sha256 "dd8aa1e594e85b547034b099cd69bb7834d5e4a93253c66c0366bba79757b2c6"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.23/cy-tls-linux-arm64"
      sha256 "1462a874744f7cf007b858d50647aae58236879b01ddd1b6a582c4e9e584f44a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.23/cy-tls-linux-amd64"
      sha256 "d3d6bd3717f9cfb025fc9c6b23f9f5cda0e125e560c59a4da38955cee4c0de72"
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
