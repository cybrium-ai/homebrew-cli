class Cyradar < Formula
  desc     "Cybrium Radar — active discovery probe for AI inference servers"
  homepage "https://github.com/cybrium-ai/cyradar"
  license  "Apache-2.0"
  version  "0.1.11"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar-releases/releases/download/v0.1.11/cyradar_0.1.11_aarch64-apple-darwin.tar.gz"
      sha256 "cc3ef8b0267066d638e2f04f1084c9c03808c9a7acd1129b2978ace3a7b63b15"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar-releases/releases/download/v0.1.11/cyradar_0.1.11_x86_64-apple-darwin.tar.gz"
      sha256 "66dfde371c2d89f4e9ba6999052ce4e0ecf29030fa6e34cae54051a737742e26"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar-releases/releases/download/v0.1.11/cyradar_0.1.11_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd54b7c4732950cafe1b806992795da768a88f1b8a7f94fa97979693118ef683"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar-releases/releases/download/v0.1.11/cyradar_0.1.11_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e3772486701eaeb90a494211ec7b594c1e793004b29aecbcc605f7b06bb5472"
    end
  end

  def install
    bin.install "cyradar"
    (prefix/"rules").install Dir["rules/*"]
  end

  test do
    system "#{bin}/cyradar", "version"
  end
end
