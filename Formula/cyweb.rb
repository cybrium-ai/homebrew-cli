class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "MIT"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.1.0/cyweb-darwin-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.1.0/cyweb-darwin-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.1.0/cyweb-linux-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.1.0/cyweb-linux-amd64"
      sha256 "PLACEHOLDER"
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
