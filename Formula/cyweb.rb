class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.8.8"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.8/cyweb-darwin-arm64"
      sha256 "6785ef4ac5738e08c7b4566e22f9e12a10d960af93d653c8e32be9c5c4b8f3b6"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.8/cyweb-darwin-amd64"
      sha256 "43aad72e0d73ff5ce944465b87bce4e996c46d057052a3544c22d5d1af9e60cc"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.8/cyweb-linux-arm64"
      sha256 "c55478c9607292d6fd7b4f37ac62377c9c74091b064fe39a6672ae7a0d44badf"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.8/cyweb-linux-amd64"
      sha256 "a226092c208a2fefd5c16a48e491063fb2176258ca392d0ecc7de57abe357e5a"
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
