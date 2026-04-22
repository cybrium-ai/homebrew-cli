class Cywave < Formula
  desc     "Cybrium wireless RF sensor — Wi-Fi, BLE, Zigbee detection"
  homepage "https://github.com/cybrium-ai/cywave"
  license  "MIT"
  head     "https://github.com/cybrium-ai/cywave.git", branch: "main"
  depends_on "rust" => :build
  def install
    system "cargo", "install", *std_cargo_args
  end
  test do
    assert_match "cywave", shell_output("#{bin}/cywave version")
  end
end
