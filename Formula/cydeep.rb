class Cydeep < Formula
  desc     "Cybrium PLC deep inspection — Purdue Level 0 visibility"
  homepage "https://github.com/cybrium-ai/cydeep"
  license  "MIT"
  head     "https://github.com/cybrium-ai/cydeep.git", branch: "main"
  depends_on "rust" => :build
  def install
    system "cargo", "install", *std_cargo_args
  end
  test do
    assert_match "cydeep", shell_output("#{bin}/cydeep version")
  end
end
