class CybriumAgent < Formula
  desc     "Cybrium on-premise security agent — sensor orchestration + platform sync"
  homepage "https://github.com/cybrium-ai/cybrium-agent"
  license  "Apache-2.0"
  head     "https://github.com/cybrium-ai/cybrium-agent.git", branch: "master"
  depends_on "rust" => :build
  def install
    system "cargo", "install", *std_cargo_args
  end
  test do
    assert_match "cybrium-agent", shell_output("#{bin}/cybrium-agent version")
  end
end
