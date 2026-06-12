class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "1.1.3"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.3/cyscan_1.1.3_aarch64-apple-darwin.tar.gz"
      sha256 "1088bfca7e1ccd12d8de7e0b1256b6f6f62b22bd9e153c3fd251bb768a0d7442"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.3/cyscan_1.1.3_x86_64-apple-darwin.tar.gz"
      sha256 "62c55fbc9b86e534e310ce9743673aaaf55ec40b4af4a0b7897add1e5789a05d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.3/cyscan_1.1.3_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ef3757dbeec38a8eae3c81788030008af1435681f8f1f26bab7f1429cfa2407"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.3/cyscan_1.1.3_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7215f798537f10727dde4b1042cefe47b9fcd63ae9b35056e4a65fc995f21c27"
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
