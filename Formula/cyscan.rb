class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "1.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.0/cyscan_1.1.0_aarch64-apple-darwin.tar.gz"
      sha256 "8c20ef97abd75673ba83d6a202bc7afa9b10cea6f30bbcdfdbdcee1acc9d8d4d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.0/cyscan_1.1.0_x86_64-apple-darwin.tar.gz"
      sha256 "f1e5a96c11fc48c06baa411daba393d77ee3edef6f60daa28193512cf8bb31de"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.0/cyscan_1.1.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26c79648b34f8c5dbf9f46824e21cf00d0408494b063b2898baafee8eb9645cf"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v1.1.0/cyscan_1.1.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "312dbaefb3f7f8d4617cee4f40aaa780cf5f51a599abc61fb62ce768d0db8b30"
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
