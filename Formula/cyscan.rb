class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.24.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.24.0/cyscan_0.24.0_aarch64-apple-darwin.tar.gz"
      sha256 "b0248090e7a23ea5289ab8bdc8e628d824937042995f1af71c666982eb05de1c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.24.0/cyscan_0.24.0_x86_64-apple-darwin.tar.gz"
      sha256 "b9182ffa3769956b3486fe7664ffda3f39dedeffc578bbd62465accbd755453f"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.24.0/cyscan_0.24.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "542679d36932ea2dc1e909288b146b495cf4ab9f858a84ad2542d7869153a028"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.24.0/cyscan_0.24.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa99fe3576bcf1916361496296f09a39a077f38d36384c5902e8060576f7fef8"
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
