class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.22"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.22/cy-tls-darwin-arm64"
      sha256 "671d5243d5f64173c56dede9b3c13c1a8ce895620caf5788d3d3a07ac353c2ad"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.22/cy-tls-darwin-amd64"
      sha256 "d942a7b98bc751170ca7e267f5acf33f999f35b1c261313ba6336c3ed462961e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.22/cy-tls-linux-arm64"
      sha256 "f162f3f2469115b645ddf4e023dd6bbb70bb6ec07c86492a968b5d2b5eb638d8"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.22/cy-tls-linux-amd64"
      sha256 "8854e3a4d6b67b22878ca8b8d2e6bd76fae2bd2756bd698f34558cf5d666f75e"
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
