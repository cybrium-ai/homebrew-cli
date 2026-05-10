class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.8.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.2/cyweb-darwin-arm64"
      sha256 "39412eaae18cafb13a01cb994cd9073e919b54148ef3e7a4aefe051938587c0b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.2/cyweb-darwin-amd64"
      sha256 "6f0d30e0410b6c81cc97202d5ec4c1cc1a7ea52971ce6fa064e84b8fcc4e24b2"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.2/cyweb-linux-arm64"
      sha256 "51986f8e026bcbc8fac00bcbc259ee84cf6b2a002f158f6919d99902ae7040ab"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.2/cyweb-linux-amd64"
      sha256 "5e9f043182a4917dce226f78bc3ded67c4c3ab6b60adaecc6440ad5a19da65f8"
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
