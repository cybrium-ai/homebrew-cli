class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.11.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.11.0/cyscan_0.11.0_aarch64-apple-darwin.tar.gz"
      sha256 "87a40933b9d3bf01d64a9a234c46aa46d6d4d144db12774ec3a52d7700636004"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.11.0/cyscan_0.11.0_x86_64-apple-darwin.tar.gz"
      sha256 "803af020c22a5aced03fa9dbd6639b8f12ca72922a7dd236fe3ab1ddaf6124ad"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.11.0/cyscan_0.11.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77abdc49bcd9136db1e6c716bd2e7fba171fbcf582e626796d57a438ff290938"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.11.0/cyscan_0.11.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7c483266f56a6b9ced0a62c7b95e168f802a6ddc07eb25c497acfca69e65ef1"
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
