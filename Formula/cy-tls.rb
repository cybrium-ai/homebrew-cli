class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.28"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.28/cy-tls-darwin-arm64"
      sha256 "2b0ca981b3dece383eb60c92e17e0843f66a5a0fee70910d6155458e6b52deaf"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.28/cy-tls-darwin-amd64"
      sha256 "d274394bf46d75eaefa3837d6ab21ec4f22a4187d60909ca944b75a470235db8"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.28/cy-tls-linux-arm64"
      sha256 "9a723a1922f8de451ee0bb189795ff45ebcf1331a64dcd1ae25d1ca91b5d2108"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.28/cy-tls-linux-amd64"
      sha256 "d29d4b5a7d3ba003822af54f4ef9dc306956bb467e2384a87ae9b94191a16234"
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
