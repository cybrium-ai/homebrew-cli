class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "1.0.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.0.0/cyscan_1.0.0_aarch64-apple-darwin.tar.gz"
      sha256 "8a2b7c039c0d5b79f1c5ff9d162362a6a1f74d33beb27b07c46050c5d6b3e15f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.0.0/cyscan_1.0.0_x86_64-apple-darwin.tar.gz"
      sha256 "3075da8f65900ec818c38adec3e2290062bd6d6c4d7916b59e36867e00fc1f50"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.0.0/cyscan_1.0.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67058b68f043425db4c5e6d4b1f1f1e4bf48ae1f730fbe37b20a9699e10a7eec"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.0.0/cyscan_1.0.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53a231c00e6158c7b8ac72848e40fdd8ecdce00d78d8a136045403a8ddbd4c4f"
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
