class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.47"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.47/cy-tls-darwin-arm64"
      sha256 "060a386cfe29fcbf6848d3e5e8e577c0185c24e302d1b2ab116c8562a16eb24c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.47/cy-tls-darwin-amd64"
      sha256 "820986a17e01b8a44869c51750cb7905b75f3683c963dcb7721a325315736f64"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.47/cy-tls-linux-arm64"
      sha256 "d6d3e9410f4b6c509a18f2fc5f447feaecc67cce952b962df93203bb9bc86e8d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.47/cy-tls-linux-amd64"
      sha256 "fe2313491cb41ceced0df9997c4302bce4b4d40b913e9613c2a364d155a46925"
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
