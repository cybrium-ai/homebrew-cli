class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.44"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.44/cy-tls-darwin-arm64"
      sha256 "68a1a252cb7845c8df9ad0b37bc1d78d27bb6c66ff3f407de816325cbab7b513"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.44/cy-tls-darwin-amd64"
      sha256 "1824fa6242ecb1c76f25e8832a7a0bcdb6517eb82e0213047d831086f2ae3a66"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.44/cy-tls-linux-arm64"
      sha256 "0a7defe42fe562795dc51272bf8ba2f3eec0d718f6cf81c34809464f8044d0ac"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.44/cy-tls-linux-amd64"
      sha256 "ef6ca02b06975a48ec8310d2c1702b94c71e6d631bd9f6a320e8afeefd637e6b"
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
