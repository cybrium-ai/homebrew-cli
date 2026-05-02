class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.12.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.12.0/cyscan_0.12.0_aarch64-apple-darwin.tar.gz"
      sha256 "6ed98a3cfe562a58617e43df498c588cc21246ce444591a45e0533aaa28494d2"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.12.0/cyscan_0.12.0_x86_64-apple-darwin.tar.gz"
      sha256 "0c41ec2b3c6f3970286016a08d11f4ceb13f0f60e75b3c619e1c214497e9e9df"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.12.0/cyscan_0.12.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bae8fd5e9ca49522b84a214b227a8e725bae2248211fcbc0377334ddab6dea27"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.12.0/cyscan_0.12.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b13839628c2816e309e4ac1d7dd04f77427bab716cd152dc1d8d320664d66a8"
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
