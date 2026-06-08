class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.58"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.58/cy-tls-darwin-arm64"
      sha256 "40897853a9c37bd34565150153773f3f4b39da6bf8c46ca3dfcc75fd764eeca2"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.58/cy-tls-darwin-amd64"
      sha256 "963f82e11132d9724e22c4a29b18e9100c21ed3f69d24338235c00de8ce0549e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.58/cy-tls-linux-arm64"
      sha256 "14f5ee5ef6f9a375c67bd5f5e301d63893cf5d14fd381ffbabf1f6747385e4a0"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.58/cy-tls-linux-amd64"
      sha256 "d3ebd5739d54b55e097a7f84f250d56273f7e810e4b687c1ad259b464445b811"
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
