class Cyguard < Formula
  desc     "Cybrium endpoint agent — process, network, software inventory"
  homepage "https://github.com/cybrium-ai/cyguard"
  license  "MIT"
  head     "https://github.com/cybrium-ai/cyguard.git", branch: "main"
  depends_on "rust" => :build
  def install
    system "cargo", "install", *std_cargo_args
  end
  test do
    assert_match "cyguard", shell_output("#{bin}/cyguard version")
  end
end
