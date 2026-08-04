class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.6.3"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.3/cy-tls-darwin-arm64"
      sha256 "9f3f383963fddd09f69b2963c98762a7073ec1fb51f662ccb61ddbf4908f1df9"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.3/cy-tls-darwin-amd64"
      sha256 "967258d332a0794e0e9d5a3aa022a8edf23d1c6dd3e6021d197ddf33be5fff5e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.3/cy-tls-linux-arm64"
      sha256 "0353222a021ecabf1591928247ae14f381c0351615d54a601d52abe550f62f90"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.6.3/cy-tls-linux-amd64"
      sha256 "56ced0f13daca42b2c3e1e3472f4f4e7b8198aa7f645ef8127f853345b25d08d"
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
