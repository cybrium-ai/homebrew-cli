class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "1.2.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.2.0/cyscan_1.2.0_aarch64-apple-darwin.tar.gz"
      sha256 "6f325c4b11da0665ad3a5d1d2c37738d570487add60e1f947cf681c09ce27ea3"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.2.0/cyscan_1.2.0_x86_64-apple-darwin.tar.gz"
      sha256 "f53dd94dd90f7199934950fea877bf463b1cdf4ab8d3875c003564fe5c4a1b13"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.2.0/cyscan_1.2.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f54544b8aadf73d6553903ce7a45e734d131da076fc693203a85606cbef0640"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.2.0/cyscan_1.2.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9a1d07bc0a4f18712d0567c7c1c90a31751c0b44c216dd2d71587055354fa05"
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
