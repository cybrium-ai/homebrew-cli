class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.8.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.0/cyscan_0.8.0_aarch64-apple-darwin.tar.gz"
      sha256 "4f4d7c896b096035a42e3128b8f12b6231ba5d0f12fe7368473d6164b16d2f68"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.0/cyscan_0.8.0_x86_64-apple-darwin.tar.gz"
      sha256 "db0f35bc86717f5500f3ac12d56896753f51ca043361d77c159d16d229e427b4"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.0/cyscan_0.8.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32298ed579b40f3ffea138b3255ecf013a37856b54b631128d77d976f254bc9d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.0/cyscan_0.8.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b35f33f8f7c41c3a328097ee79bcdcd0215b7adaba593d3877993f9e30e8bd8a"
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
