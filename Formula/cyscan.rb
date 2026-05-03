class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "1.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.0/cyscan_1.1.0_aarch64-apple-darwin.tar.gz"
      sha256 "e05aad832c8673c53c35fe1eb54f5cfd0d19b03f2bf7478bc5127623213862b8"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.0/cyscan_1.1.0_x86_64-apple-darwin.tar.gz"
      sha256 "9fca4ae8244f2e63e07f531cb2b2f77e7e1e3057a62a215a719028044d2bf4c1"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.0/cyscan_1.1.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c76fd09c6b6380f8f294575f8337bd38d055846f20529e5ff8a33d633157c843"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.0/cyscan_1.1.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b1c6d70fd1c18f891275386f8dc2dbdfc1266ae282864970c559f6275c410a7"
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
