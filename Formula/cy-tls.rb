class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.0/cy-tls-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "42d97cc5ca71f2215ad3bc6c06385573235b0a8e199c7843333408875f755a74"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.0/cy-tls-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "dd81e7461ba1d6d8457faa783d510e16ff38610ed281e50ada98e26a32bf842a"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.0/cy-tls-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d915b83f980d59ae87ea0b1871862d3c3a0798be452c67c8c6b6509599a8eb5f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.0/cy-tls-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed8818cd8183bcdda8d3b25cfe5f745720b01b9c640e87a8fa5aa3bd94335f5f"
    end
  end

  def install
    bin.install "cy-tls"
  end

  test do
    assert_match "cy-tls", shell_output("#{bin}/cy-tls --version")
  end
end
