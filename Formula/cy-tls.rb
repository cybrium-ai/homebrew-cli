class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.1/cy-tls-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "7c21e27ca64bce62cf4fcb278ae84e5c08828c8508d17a0d11dc9688ec282c26"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.1/cy-tls-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "93a4b152e2e18ad414e7e17688439c5d049463a9dbe06dd787052a83f6c58ade"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.1/cy-tls-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "20c6804d68d72b5b0ff1c7964464b89fbc85bd061f2cd21f2f5f4ec5143c67bf"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.1/cy-tls-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ed0657bf2370c8ec66b94db9d2bbd3cd37cc39eb361fe9a210a40459be1ffb9"
    end
  end

  def install
    bin.install "cy-tls"
  end

  test do
    assert_match "cy-tls", shell_output("#{bin}/cy-tls --version")
  end
end
