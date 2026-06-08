class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.65"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.65/cy-tls-darwin-arm64"
      sha256 "10290611c296916a84fad10141fb996b98474259f037067a7bbb736cc50af464"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.65/cy-tls-darwin-amd64"
      sha256 "f01f4e3e2d6816251d14da141a7ff165b714c443545265fa6d7a1f0760fc8a52"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.65/cy-tls-linux-arm64"
      sha256 "ca6d0e7e4fb0114f0333e9288603dbf2a4bd2199bfdef18be278ca6fe89156ed"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.65/cy-tls-linux-amd64"
      sha256 "ba43772058f39d0911c7154ae181605ced2b20b3cd9e90906380c75dfcebfbed"
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
