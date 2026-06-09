class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.76"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.76/cy-tls-darwin-arm64"
      sha256 "9359630ae67bbed572405c1d388b9397851d40998ddc6cdc44b1a7dbab498c6d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.76/cy-tls-darwin-amd64"
      sha256 "a5c227a625bfd7a8ca5cd2847620130a4e9294beac0154708eae3197413b17fc"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.76/cy-tls-linux-arm64"
      sha256 "20bcd9c92466837e3fa2ff9e37410905d5dfc1db9c209f462c129be4a8d65656"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.76/cy-tls-linux-amd64"
      sha256 "348aae3a48169900582459660d7eae2d086cd9676a944a91b7f5ae5bec156cf7"
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
