class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.4.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.4.0/cyscan_0.4.0_aarch64-apple-darwin.tar.gz"
      sha256 "c713c8ec2a35fcd7c07ab11152300aa8dfba9f66fc52657f02996d8db8bdf4f0"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.4.0/cyscan_0.4.0_x86_64-apple-darwin.tar.gz"
      sha256 "2955280928d631868f0b9a70b605b2752e4c2fe3987cd157c1b8501eaae68ad2"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.4.0/cyscan_0.4.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66c3536eeecda2948298ccc1ddeb510880f6495dfbd06bd2b5c9b0bd4eb3e284"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.4.0/cyscan_0.4.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14c9ccf94eedab460c2bbe65ad8ccc8abbef4585d2f71ca4fd1103f6b6564f07"
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
