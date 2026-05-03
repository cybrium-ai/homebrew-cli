class CybriumAgent < Formula
  desc     "Cybrium on-premise security agent — sensor orchestration + platform sync"
  homepage "https://github.com/cybrium-ai/cybrium-agent"
  license  "Apache-2.0"
  version  "0.2.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cybrium-agent/releases/download/v0.2.0/cybrium-agent-darwin-arm64"
      sha256 "3f8ae30c4772fcc108a877883219485ab83e2d507f93e33afbb062ef1d47d44c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cybrium-agent/releases/download/v0.2.0/cybrium-agent-darwin-amd64"
      sha256 "5acde518b3241a455e4d1414bf30da5a4cf72aa4b0d310f22e665aae23a4f8a6"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cybrium-agent/releases/download/v0.2.0/cybrium-agent-linux-arm64"
      sha256 "88035045a6576b77e6fa692e12dbdcb8099d34e56322d6d727d15a6d608e4613"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cybrium-agent/releases/download/v0.2.0/cybrium-agent-linux-amd64"
      sha256 "1b11386aa312f7c20dd411afb22f0d903080d9a6d7cd5aea63e04e60407ef8f5"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cybrium-agent-darwin-arm64" => "cybrium-agent"
    elsif OS.mac?
      bin.install "cybrium-agent-darwin-amd64" => "cybrium-agent"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cybrium-agent-linux-arm64" => "cybrium-agent"
    else
      bin.install "cybrium-agent-linux-amd64" => "cybrium-agent"
    end
  end

  test do
    assert_match "cybrium-agent", shell_output("#{bin}/cybrium-agent version")
  end
end
