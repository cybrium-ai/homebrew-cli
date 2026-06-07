class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.12"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.12/cy-tls-darwin-arm64"
      sha256 "e0299c1dae10f971bd79581dcc70aeabe7d082d7b778b8670d17f7caaabb772e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.12/cy-tls-darwin-amd64"
      sha256 "3a1ee28f4c5d675dce56663012abe7c596322fc467d0adddb018202dd1738a0e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.12/cy-tls-linux-arm64"
      sha256 "c3a79d0bdd29a334be1b87c041f6d055d9735ebce289fa735dbb5866107d9460"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.12/cy-tls-linux-amd64"
      sha256 "8926ca7cefbcd77e08bec0ae367563dd66fd598d387d05ca0c6b97c0e974e296"
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
