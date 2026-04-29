class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.8.2"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.2/cyscan_0.8.2_aarch64-apple-darwin.tar.gz"
      sha256 "c6dad5983282c9552e2729e3a8e3db1d5205ecb0bb77fdba6cf96741e399e874"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.2/cyscan_0.8.2_x86_64-apple-darwin.tar.gz"
      sha256 "174558f4482f321009e725849285dafd765e17d34456a76e0d74afe4e9721441"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.2/cyscan_0.8.2_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56adbfa4c2e0020137fdb4ef135709c44dd1892b8f1d7de352a2b26e61aee3e1"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.2/cyscan_0.8.2_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1b099131a952951d0a3abc9a51b90368a289dd3243057046322bbef64474aee"
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
