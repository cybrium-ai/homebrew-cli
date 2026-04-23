class CybriumAgent < Formula
  desc     "Cybrium on-premise security agent — sensor orchestration + platform sync"
  homepage "https://github.com/cybrium-ai/cybrium-agent"
  license  "Apache-2.0"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cybrium-agent/releases/download/v0.1.0/cybrium-agent-darwin-arm64"
      sha256 "a3181b400761730ea28c548e9beb2e44566959a8ced8bef65090eabdded2435f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cybrium-agent/releases/download/v0.1.0/cybrium-agent-darwin-arm64"
      sha256 "a3181b400761730ea28c548e9beb2e44566959a8ced8bef65090eabdded2435f"
    end
  end

  on_linux do
    on_intel do
      url    "https://github.com/cybrium-ai/cybrium-agent/releases/download/v0.1.0/cybrium-agent-linux-amd64"
      sha256 "1df694f694e948d89780e176a1bf25eae084b0386087ebb0770ee648be584a0c"
    end
  end

  def install
    if OS.mac?
      bin.install "cybrium-agent-darwin-arm64" => "cybrium-agent"
    else
      bin.install "cybrium-agent-linux-amd64" => "cybrium-agent"
    end
  end

  test do
    assert_match "cybrium-agent", shell_output("#{bin}/cybrium-agent version")
  end
end
