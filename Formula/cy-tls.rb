class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.10"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.10/cy-tls-darwin-arm64"
      sha256 "cd0478e5d06124a3393966958fe72a85464bbb42cbcea16a198e865fbc5bea8c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.10/cy-tls-darwin-amd64"
      sha256 "76ad1323c92dfaacc0ff3e80e699ffc67e00b367058276eca49334a02706f74c"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.10/cy-tls-linux-arm64"
      sha256 "93c1691af530cc26dc0a70245dd0a026ef46873c192599104c15dca37b49f37b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.10/cy-tls-linux-amd64"
      sha256 "aee0333a8a6319fd1a5522d0a6002d50669a34316e879a2c8e503766ab5af9d1"
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
