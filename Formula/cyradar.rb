class Cyradar < Formula
  desc     "Cybrium Radar — active discovery probe for AI inference servers"
  homepage "https://github.com/cybrium-ai/cyradar"
  license  "Apache-2.0"
  version  "0.1.10"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar-releases/releases/download/v0.1.10/cyradar_0.1.10_aarch64-apple-darwin.tar.gz"
      sha256 "40b49117750a9d416c6e3c5151f50cc239f52a9287eccd1192ee04d8799a41ba"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar-releases/releases/download/v0.1.10/cyradar_0.1.10_x86_64-apple-darwin.tar.gz"
      sha256 "bee392e2e57ab097a7b268a206b39c4951752348fe257fb9209a45b0ec5001b5"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar-releases/releases/download/v0.1.10/cyradar_0.1.10_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b45a115cfa6a12db4d4c6bc07fa23c5ef4c821b50188269801626c4b5e1a57ee"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar-releases/releases/download/v0.1.10/cyradar_0.1.10_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f2ee3413fb43b684f5bb4acdea409c76280714e64852a9947fc9b9144c33af9"
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
