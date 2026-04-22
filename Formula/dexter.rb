class Dexter < Formula
  desc     "Cybrium AI remediation engine — detect, fix, verify"
  homepage "https://github.com/cybrium-ai/dexter"
  license  "MIT"
  head     "https://github.com/cybrium-ai/dexter.git", branch: "main"
  depends_on "rust" => :build
  def install
    system "cargo", "install", *std_cargo_args
  end
  test do
    assert_match "dexter", shell_output("#{bin}/dexter version")
  end
end
