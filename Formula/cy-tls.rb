class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.62"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.62/cy-tls-darwin-arm64"
      sha256 "09aa35405a0d7d02562ba5f6067b0105700ab0df30b7e700f83c733a4960a8d5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.62/cy-tls-darwin-amd64"
      sha256 "c45e1ada126a3d1f59a194bae60c4aafae465d9a672bf2493a8e75cbe3088ff8"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.62/cy-tls-linux-arm64"
      sha256 "7525eb357695eec4d0d1b02c93a47ddd64fcbb6d0cc853c604be5dd30a57080f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.62/cy-tls-linux-amd64"
      sha256 "41cdf339cf2d73625b93ca2590fba4d0c5a50fc590d7c46dbd0c2d24aa357d2a"
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
