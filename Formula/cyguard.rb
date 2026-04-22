class Cyguard < Formula
  desc     "Cybrium endpoint agent — process, network, software inventory"
  homepage "https://github.com/cybrium-ai/cyguard"
  license  "MIT"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.0/cyguard-darwin-arm64"
      sha256 "462a5372f40d86efdf85bf2c1c116533e2bb352c35d4a999b37779985f20a28d"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.0/cyguard-darwin-amd64"
      sha256 "94574778c7a28e23e502ee8799877038feb4db18cdde5c7d574dc85692baea11"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.0/cyguard-linux-arm64"
      sha256 "9b78e0b9fbe603ec4db5450b70d0c95ae702553c82a1e1e0c76c9b7f6772dd0e"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.0/cyguard-linux-amd64"
      sha256 "057dc990d8df6c97e05235ff7a872b4d7c6126999cbdf4f9200e87c3ac9d642d"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cyguard-darwin-arm64" => "cyguard"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cyguard-darwin-amd64" => "cyguard"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cyguard-linux-arm64" => "cyguard"
    else
      bin.install "cyguard-linux-amd64" => "cyguard"
    end
  end

  test do
    assert_match "cyguard", shell_output("#{bin}/cyguard version")
  end
end
