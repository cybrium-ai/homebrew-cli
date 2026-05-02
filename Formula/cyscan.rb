class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.10.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.10.0/cyscan_0.10.0_aarch64-apple-darwin.tar.gz"
      sha256 "2affb5aaa037f13058c371f6c5967d86fed483d83f44907b105e8408e488869c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.10.0/cyscan_0.10.0_x86_64-apple-darwin.tar.gz"
      sha256 "40bbc030a03a8c7b51cfdaae9898f626111cb1edd4c878f2515cd1ad0d90484b"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.10.0/cyscan_0.10.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc35d030bcfb45e2afc86198454edd732aa01970618f31b23d27d0cc409e70d4"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.10.0/cyscan_0.10.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "83052d7dc5f2155dad06f54253d8398619b4cc16bd62c0cdb630383ac8ef7472"
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
