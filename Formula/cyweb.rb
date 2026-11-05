class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.14.4"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.14.4/cyweb-darwin-arm64"
      sha256 "8dd2d8cf48d80124b02e38f71229c23f41469684d125367ad080a4a017b252db"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.14.4/cyweb-darwin-amd64"
      sha256 "a85488b540a1931ffdbe7548d15e5c3972f540cd028d73737a78495518e34fa0"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.14.4/cyweb-linux-arm64"
      sha256 "ebed69d9df2d8c8a5eef86337eb4376f3d00acf29b6ec8a00c80e251f7601d7c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.14.4/cyweb-linux-amd64"
      sha256 "8d3e8bae446e13b38eeabd76262c5dcdf981a2dee546221d8b6ff637d3385af8"
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
