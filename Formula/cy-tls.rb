class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.6"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.6/cy-tls-darwin-arm64"
      sha256 "dbb658b5dc31a12f2d3646e61a72424c409ac818148dd434ca9679e33d74c524"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.6/cy-tls-darwin-amd64"
      sha256 "1a639e6bdf706d66411642e0acb396889a794c2f79ee5a6aa35cf38d42b8be50"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.6/cy-tls-linux-arm64"
      sha256 "327e01b9703b6b376470919d05f5dc8c6c327939fb259668f9064eaec0ca8f2b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.6/cy-tls-linux-amd64"
      sha256 "e579746927d5f1ab25054461936b5b5a7504e6c8e7983e8e180ddd299c872429"
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
