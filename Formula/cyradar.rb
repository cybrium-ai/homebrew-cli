class Cyradar < Formula
  desc     "Cybrium Radar — active discovery probe for AI inference servers"
  homepage "https://github.com/cybrium-ai/cyradar"
  license  "Apache-2.0"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.0/cyradar_0.1.0_aarch64-apple-darwin.tar.gz"
      sha256 "cd7fb7e27a73746ad901d85ed3cc8f4569592f54c8e8aab6e5340ff142fd1bc9"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.0/cyradar_0.1.0_x86_64-apple-darwin.tar.gz"
      sha256 "290fc4d4523031da565b7945e4af7a3cd837d41312ddb7a3a3a8548ac688127d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.0/cyradar_0.1.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb82160359bd65cc08ad086260fa38797c72db9b08b197f88711b062a7737656"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyradar/releases/download/v0.1.0/cyradar_0.1.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a3274d57b9b695eec36d3bf9e26cfde2e35b3f1ca0e944d28f7eca9648fea34"
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
