class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.4.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.4.0/cymail-darwin-arm64"
      sha256 "e6fe0fe8107999cbd77106f23ae5f7fb0a4246ff80785539f006fb09db4f00f2"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.4.0/cymail-darwin-amd64"
      sha256 "85d892abda00e29970da9747908d5925f904e4000d389d74e7b0a7c60b623802"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.4.0/cymail-linux-arm64"
      sha256 "c0fbff00e7c19ed4cc7f30fd1c50fffe82c09114ac226c762a4f2c8fca501c08"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.4.0/cymail-linux-amd64"
      sha256 "16a2863d81277b4f0c9d78a21c6f2ebcb7d82dc02fe1f2b8eb57ae983f22c3d3"
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
