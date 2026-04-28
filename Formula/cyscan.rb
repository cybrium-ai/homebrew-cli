class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.5.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.5.0/cyscan_0.5.0_aarch64-apple-darwin.tar.gz"
      sha256 "4180a280b8470af6228fbf614bf81449cdc0a38ee1b9fc33e0d2cafd735b33d5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.5.0/cyscan_0.5.0_x86_64-apple-darwin.tar.gz"
      sha256 "54fd86caf9a329b5ffc9c98148c7b4ffa30ca61fd84a85e74face6a20631264d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.5.0/cyscan_0.5.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1b4823ce4561aafc2b95c1126a6a01045aa3c8454f0148f0bc87c5155c7bae9"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.5.0/cyscan_0.5.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b0804e30baff23b8e957a2ee332b8a3b07669d5816c96d35532105cc4a71511"
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
