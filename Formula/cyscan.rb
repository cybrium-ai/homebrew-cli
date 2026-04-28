class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.7.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.7.0/cyscan_0.7.0_aarch64-apple-darwin.tar.gz"
      sha256 "f5608cc4884316123826d1a4ab9476276abbf566b03fac570bb78e797ee72a2d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.7.0/cyscan_0.7.0_x86_64-apple-darwin.tar.gz"
      sha256 "87e48057748615dba99907a096f42a9fe44172600d498a563428340192864a78"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.7.0/cyscan_0.7.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "704223a15656dc58d429bf7023ddd281007db8fbd518f2261a7a0aada68e1b01"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.7.0/cyscan_0.7.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33c6c1d5b50ef6c9f083e2b470ab75352f339d2c4b555f423881a833477f1310"
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
