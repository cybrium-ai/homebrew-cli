class Cyred < Formula
  desc     "Cybrium Red — adversarial prompt suite + prompt-injection + data-exfil probe for LLMs"
  homepage "https://github.com/cybrium-ai/cyred"
  license  "Apache-2.0"
  version  "0.1.5"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyred-releases/releases/download/v0.1.5/cyred_0.1.5_aarch64-apple-darwin.tar.gz"
      sha256 "8dc98d5120865714e4a742dbf344c274c355a730de6846c83f1e261a91f7c3d6"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyred-releases/releases/download/v0.1.5/cyred_0.1.5_x86_64-apple-darwin.tar.gz"
      sha256 "490fcaed5906f5a18bf1d431e3152f609e7789bf54fc1dc74ae83c92a13bba2e"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyred-releases/releases/download/v0.1.5/cyred_0.1.5_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f46be999d04aa722b585742ad40efa1a3fcb11aaa9c0a144d7d8877c31ef0481"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyred-releases/releases/download/v0.1.5/cyred_0.1.5_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "702e3d87250129742c90735a8ab699e34bb3eb6063f0507c311800fb9cd72df5"
    end
  end

  def install
    bin.install "cyred"
    (prefix/"templates").install Dir["templates/*"]
  end

  test do
    system "#{bin}/cyred", "--version"
  end
end
