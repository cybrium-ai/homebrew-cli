class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "1.0.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.0.1/cyscan_1.0.1_aarch64-apple-darwin.tar.gz"
      sha256 "3d8becf8e154c35a6f75db1ae8cda099e40d2a247e4e1dcbe4ad98dcea0e3baa"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.0.1/cyscan_1.0.1_x86_64-apple-darwin.tar.gz"
      sha256 "753c572deb5bb1a6289a2ee1b33a128a0e31529d24e0b4e2b46d53e77ae52e96"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.0.1/cyscan_1.0.1_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a48e8ff0d658688c24b93161a11c3d6f1b01da28e7fd4579db62c9278e04e0b5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.0.1/cyscan_1.0.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f4569a8dd56a58060747d5c55bae50159b9c1cb2ec56ce50cb37fda0bb8a5e0"
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
