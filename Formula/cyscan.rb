class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.6.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_aarch64-apple-darwin.tar.gz"
      sha256 "8a97d555f6f401509482849ea79b17a6de19a56affcdbb72b28bda34a539b91b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_x86_64-apple-darwin.tar.gz"
      sha256 "a16d23190156dd601833bf3a96adcc8f61cca9055d235cc3be56bab30c10714b"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b84ff21c9d2ba3e95f79283a582f53c0db68535642b6057c13057175dd1d6e3"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f641c0dbf97812f1a309ca5e92cbb6e3615ff88dc6dcdcafd38b2dac2bcd76f"
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
