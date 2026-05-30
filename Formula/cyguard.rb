class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyguard"
  license  "Apache-2.0"
  version  "0.1.6"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.6/cyguard-darwin-arm64"
      sha256 "e98ea61a7f172b2d9f9f2d2e394f3952f5e7c37f7f522ca49a07dc58db55ba49"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.6/cyguard-darwin-amd64"
      sha256 "7d557a9579a1d08a1d4117185c3db74538b29b0162d22e3b5778fb69811625b3"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.6/cyguard-linux-arm64"
      sha256 "cbe4053e39a1e9e4bc9639e6c13771f55de56f6d6e26258d5097e78302e2901c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.6/cyguard-linux-amd64"
      sha256 "8327f233f2f4d79736791e3ec5de8c95685494f55adf5fa5ebdf417f5552e04a"
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
