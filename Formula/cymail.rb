class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.1.8"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.8/cymail-darwin-arm64"
      sha256 "1a4ed38bb738e2abbaf4cf5a3e23be48d460a16e861d46b711b66262472e5615"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.8/cymail-darwin-amd64"
      sha256 "9a2d88ab147e15280271449e097e2e29ff9070d870549eddec7275bb0f24539d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.8/cymail-linux-arm64"
      sha256 "ab62ac22672a8cfcbfb7e0e2b70c7249dc18d972175e5bf8f2cddf4288f9cb0a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.8/cymail-linux-amd64"
      sha256 "fd85f53e909cfa9b68ace664374dc3d3060bacf9c585f79ae15713d37c89daee"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cymail-darwin-arm64" => "cymail"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cymail-darwin-amd64" => "cymail"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cymail-linux-arm64" => "cymail"
    else
      bin.install "cymail-linux-amd64" => "cymail"
    end
  end

  test do
    assert_match "cymail", shell_output("#{bin}/cymail version")
  end
end
