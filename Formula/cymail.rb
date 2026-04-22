class Cymail < Formula
  desc     "Cybrium email security scanner — SPF, DKIM, DMARC scoring"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "MIT"
  head     "https://github.com/cybrium-ai/cymail.git", branch: "main"
  depends_on "rust" => :build
  def install
    system "cargo", "install", *std_cargo_args
  end
  test do
    assert_match "cymail", shell_output("#{bin}/cymail version")
  end
end
