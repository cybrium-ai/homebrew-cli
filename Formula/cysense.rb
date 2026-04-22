class Cysense < Formula
  desc     "Cybrium network passive sensor — traffic capture + protocol dissection"
  homepage "https://github.com/cybrium-ai/cysense"
  license  "MIT"
  head     "https://github.com/cybrium-ai/cysense.git", branch: "main"
  depends_on "rust" => :build
  depends_on "libpcap"
  def install
    system "cargo", "install", *std_cargo_args
  end
  test do
    assert_match "cysense", shell_output("#{bin}/cysense version")
  end
end
