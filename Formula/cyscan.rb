class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.9.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.9.1/cyscan_0.9.1_aarch64-apple-darwin.tar.gz"
      sha256 "72b086fcce97c0e4bb86e2e651ea5ef77552c96e326ccdc54ac36d4dba72b817"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.9.1/cyscan_0.9.1_x86_64-apple-darwin.tar.gz"
      sha256 "a23d71016b95e0a1b468901a0d81c7a56d0b66893c5c50e267b56b02fe5f8f49"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.9.1/cyscan_0.9.1_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d1e8aeb7c771e5f942cdc9557de8a7681f3d21a60ecee0af2ca88e1fb17f46a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.9.1/cyscan_0.9.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e97137f7a2e51c3b652d36197342b79d1b086959953afdb9b2ea7cdc0196783"
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
