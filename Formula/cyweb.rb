class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.9.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.9.0/cyweb-darwin-arm64"
      sha256 "badba543121cb642c860b44cd6fecc08eac805e7b0bc4e46b249e764948a8d88"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.9.0/cyweb-darwin-amd64"
      sha256 "9484bf250d37ad8b67bb3bdc77e0f6003bf1406cc6f79842946b33eeef1e28e4"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.9.0/cyweb-linux-arm64"
      sha256 "f8dfd3e9d361a8c0986e48ef040d4c576d8f06721836a670f8e8a1e9252ce651"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.9.0/cyweb-linux-amd64"
      sha256 "614367a5aefc190fb346ea9cc6e924a7d601d2ac73128748c38f5358a8d78a2e"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cyweb-darwin-arm64" => "cyweb"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cyweb-darwin-amd64" => "cyweb"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cyweb-linux-arm64" => "cyweb"
    else
      bin.install "cyweb-linux-amd64" => "cyweb"
    end
  end

  test do
    assert_match "cyweb", shell_output("#{bin}/cyweb version")
  end
end
