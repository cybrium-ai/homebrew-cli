class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.3.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.3.0/cyscan_0.3.0_aarch64-apple-darwin.tar.gz"
      sha256 "5134f8df492fe6b17b72d19c59add445d1fb2bf81ad84738298f4ab5585e7a22"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.3.0/cyscan_0.3.0_x86_64-apple-darwin.tar.gz"
      sha256 "b04547076c93196d3fc980ea61a37250dab14ce6444234e5b334c03726da7f26"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.3.0/cyscan_0.3.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4e10738c72469cfefc9437c26f89e13050e85d318f28388416c278ce6d79a50"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.3.0/cyscan_0.3.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62e8228375e5b329e21b04d99b0e109846262b5148c1d8469886922884c788a5"
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
