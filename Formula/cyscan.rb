class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.6.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_aarch64-apple-darwin.tar.gz"
      sha256 "ba6b8a7e30a2a1f94a4bbc7dbca5a80d8b0938f3d661c189c729a9d6213d60cb"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_x86_64-apple-darwin.tar.gz"
      sha256 "1fc00ae7ec4a1d6566a07494b5dcf62e22a3f896a80a6b727513cf61624a6ab5"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c04d4e4432971def66a142079cf87d2992cba332b0aae0efd2312cc40251f8c0"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b2d3b9839b5fc58d914c4a422a275ea1c64c7bc30e86e04222330fd86091045"
    end
  end

  def install
    bin.install "cyscan"
    (prefix/"rules").install Dir["rules/*"]
  end

  test do
    system "#{bin}/cyscan", "--version"
  end
end
