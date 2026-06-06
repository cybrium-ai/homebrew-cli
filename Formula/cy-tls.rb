class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.8"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.8/cy-tls-darwin-arm64"
      sha256 "07b998fcef623659e69ab40b9d06c22f9fff366ede4600f3877ea80d8eb690c7"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.8/cy-tls-darwin-amd64"
      sha256 "3d8df2691ce6a4ef284b5014e61d9edf1b140dc00538ff46687e94d8d07abeea"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.8/cy-tls-linux-arm64"
      sha256 "a115c22024509410266b969d891fe19d7355c2221290cc1c424ba714e1960cae"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.8/cy-tls-linux-amd64"
      sha256 "effb49a67b9b15d93ff04aca7c981d2b844f3430cbd795d026ccdc14e8d5bc91"
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
