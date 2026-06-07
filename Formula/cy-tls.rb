class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.3.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.1/cy-tls-darwin-arm64"
      sha256 "5f663a9830fb724de401c42dafd31e50a21d1a43b9960d188b5ab3ad9fb3fdf4"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.1/cy-tls-darwin-amd64"
      sha256 "380ab25ccfc4f75632c41d7338a714f109bf3cec0d828d3f42e54b6c54b98719"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.1/cy-tls-linux-arm64"
      sha256 "55b760005034d4f6a8fe5c5e0c6d2255c191f8b828cdff276fb507d362e41cad"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.3.1/cy-tls-linux-amd64"
      sha256 "4871e01ab601e513174f618f06653bb6e6812c54dc2ff724e5b44683ddb9b446"
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
