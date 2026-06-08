class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.69"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.69/cy-tls-darwin-arm64"
      sha256 "c631b552a3f49c771598e34bf4a50c219d15830ad25c034396792db4c610c96c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.69/cy-tls-darwin-amd64"
      sha256 "0464155689fa31766d8ab637a0a0f2fd94566917138fe81acf8023f2ea125fa0"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.69/cy-tls-linux-arm64"
      sha256 "f6bf4d1f72382a5d24feb19ab8a3bcdf539019a2daebf016726057270d95e1e5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.69/cy-tls-linux-amd64"
      sha256 "099371fb8f95decf1d8026ce204a0bd1434ef4541e8b389343f86581ffdf05e6"
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
