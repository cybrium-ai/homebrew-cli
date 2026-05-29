class Cymail < Formula
  desc     "Cybrium cymail — see https://github.com/cybrium-ai/cymail"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "MIT"
  version  "0.1.5"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.5/cymail-darwin-arm64"
      sha256 "555f5b3dd050c99cfef185a0307dde7771410c5e8422f1a106ab00dd7c6e2fc4"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.5/cymail-darwin-amd64"
      sha256 "c4fa333ce229be77aa792508d66f94ba3f635988881212b5d1ded943405ef55c"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.5/cymail-linux-arm64"
      sha256 "ab62ac22672a8cfcbfb7e0e2b70c7249dc18d972175e5bf8f2cddf4288f9cb0a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.1.5/cymail-linux-amd64"
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
