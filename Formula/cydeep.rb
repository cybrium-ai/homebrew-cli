class Cydeep < Formula
  desc     "Cybrium cydeep — see https://github.com/cybrium-ai/cydeep"
  homepage "https://github.com/cybrium-ai/cydeep"
  license  "MIT"
  version  "0.1.5"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.5/cydeep-darwin-arm64"
      sha256 "2981241436081f707fce88aff8cdf1238290eed50e8b379b274ed0e644defa0b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.5/cydeep-darwin-amd64"
      sha256 "a8932a9c0dbbe4c8c9d8fb0845d4195bfa0e1ba79c522acb96b6ce1573198ab9"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.5/cydeep-linux-arm64"
      sha256 "31f1f8b4dddbae2170618674d9e648bee7f0fea3465a9b2e1f940d33d257f344"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.5/cydeep-linux-amd64"
      sha256 "7761a86d5e698f09a11f5340ddc59c8074a8701bb8c39e6b3f4abd4829328a78"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cydeep-darwin-arm64" => "cydeep"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cydeep-darwin-amd64" => "cydeep"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cydeep-linux-arm64" => "cydeep"
    else
      bin.install "cydeep-linux-amd64" => "cydeep"
    end
  end

  test do
    assert_match "cydeep", shell_output("#{bin}/cydeep version")
  end
end
