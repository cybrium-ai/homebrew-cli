class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cydeep"
  license  "Apache-2.0"
  version  "0.1.6"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.6/cydeep-darwin-arm64"
      sha256 "546087a5e40beca36dbc95baebd8b9f24cd0b3387aaa187181aa0bff5358f430"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.6/cydeep-darwin-amd64"
      sha256 "3913c1994c25fac01ca7484c33dbee0ff976b1f26dcbbb84451c00f9542f27b3"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.6/cydeep-linux-arm64"
      sha256 "31f1f8b4dddbae2170618674d9e648bee7f0fea3465a9b2e1f940d33d257f344"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cydeep/releases/download/v0.1.6/cydeep-linux-amd64"
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
