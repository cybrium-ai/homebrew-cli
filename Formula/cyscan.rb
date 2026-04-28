class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.6.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_aarch64-apple-darwin.tar.gz"
      sha256 "9b8b83e22006d6608d0cf66a5082c647009285818e65f2084571b9738f272dcd"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_x86_64-apple-darwin.tar.gz"
      sha256 "492455abdaf8a72d01ce438defb4428579c54d1b7f2e369b7c3714bfae9fb311"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4734dc73363d8ef851759075d3e358fce650e7956df927d858abc4c667a67373"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.6.0/cyscan_0.6.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ea906a89e6a3e70765b4a6ac0b49c39188e6582e07597728f6054f84fb8c6d5"
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
