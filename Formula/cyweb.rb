class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.8.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.1/cyweb-darwin-arm64"
      sha256 "299376bace442e48c9af497e351d6c2e5b05a5c9f245823b62f8d810b3d76516"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.1/cyweb-darwin-amd64"
      sha256 "bac75efcddc6b11c627dda9939b6f3696ba615e24c17916a74fb35e00c1b84e9"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.1/cyweb-linux-arm64"
      sha256 "90f6daea1d412c1ce4c80b786059a2c64c93ce4c7f565b6c65562880969b5df1"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.1/cyweb-linux-amd64"
      sha256 "7de8839318077982823b32a4fbbc619a6276a2f448d313efef749e5a3d4995d4"
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
