class Cymail < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.5.3"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.3/cymail-darwin-arm64"
      sha256 "eb1f200631ce00eeaef63c5c2f604f3634e29e91715f6e630065033564683b9c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.3/cymail-darwin-amd64"
      sha256 "013d90615a62a6bc938838da01e3bd7595ebfc873527cdc961de010827e6e29d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.3/cymail-linux-arm64"
      sha256 "f9cddca5c3f1ccd51a3f35de3476f73ca48f39b898da39ba560e5c4873933891"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.3/cymail-linux-amd64"
      sha256 "3cd4f80db999717c837b859ab9d1f47932bdbff9bb04f05111a48be1a818f52e"
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
