class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "1.1.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.2/cyscan_1.1.2_aarch64-apple-darwin.tar.gz"
      sha256 "86b6e66a24f233686a52287733513893f0573ed43c1029011983ad9e7f2503a7"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.2/cyscan_1.1.2_x86_64-apple-darwin.tar.gz"
      sha256 "77490d6c615d7e836ae330acab917ad1d2b2a7ffe43740be6031e87d5fa0fdff"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.2/cyscan_1.1.2_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37eed9262fd36ebc977e28f5d1d88771785b173b8d16a76b7892eab3285c8f27"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.2/cyscan_1.1.2_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92c186962a6f11339252339b8328f4067afbaddf0c261c5a2a7633e1ea1f89a1"
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
