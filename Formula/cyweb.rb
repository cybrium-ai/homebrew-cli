class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.8.5"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.5/cyweb-darwin-arm64"
      sha256 "31169b6863eceb4469ea7459e2ab0beb95be966fe3b5f73f3ada4e7505bb224b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.5/cyweb-darwin-amd64"
      sha256 "bc1e3dc091081381e48b4c5ad83dc197d172e4d70720766c28cd8256bff63003"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.5/cyweb-linux-arm64"
      sha256 "60ecb1130b2cf310a03dc0e49b0259f79a98dbb31e39fdd241491ee466e183bc"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.5/cyweb-linux-amd64"
      sha256 "2e8f8e9b7ff6c794c8b14ef26b70167f1e97649d93ab9954ccf1c48867328536"
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
