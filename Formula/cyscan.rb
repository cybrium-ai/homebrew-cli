class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "1.1.4"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.4/cyscan_1.1.4_aarch64-apple-darwin.tar.gz"
      sha256 "1c47922a1a3ff93a0244a5e16d68c28d80b1815c1c7d0fab6b5df86829b40204"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.4/cyscan_1.1.4_x86_64-apple-darwin.tar.gz"
      sha256 "840f07f84a5c1e9e2d7cdc9f7bb69e5723839e5f1f59759c48004bf9b36355ec"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.4/cyscan_1.1.4_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e52f8aa242227c4944c5d0c6616a863f39f7d0a4a085989084630ad1fe2a938e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.4/cyscan_1.1.4_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0df25f002564c3fc735e8fbcc1698f89cd932dcd145e46846d738de50991f2d1"
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
