class Cymail < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.5.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.1/cymail-darwin-arm64"
      sha256 "1901b9a21f480bed4ec0ca2388265100bd9df72a580744f39881ed8d49996ccf"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.1/cymail-darwin-amd64"
      sha256 "b230e1171a1ec03640a605855dac5d562dbd4618eb2106890602186f75650229"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.1/cymail-linux-arm64"
      sha256 "e5d42cb1de42670ce1a8c5d8ec2be66400042cde34a957b3068f32fa1209350e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.5.1/cymail-linux-amd64"
      sha256 "5339a18a5bac6bff72963fa4278aefd466018e81b0137f6708f973150692e48d"
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
