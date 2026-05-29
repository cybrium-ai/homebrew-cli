class Cyguard < Formula
  desc     "Cybrium cyguard — see https://github.com/cybrium-ai/cyguard"
  homepage "https://github.com/cybrium-ai/cyguard"
  license  "MIT"
  version  "0.1.5"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.5/cyguard-darwin-arm64"
      sha256 "a0896e61a3c1d9f88c79e9ceeacb9bef0f26d3da936ff19eedd8e59d5b701cf9"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.5/cyguard-darwin-amd64"
      sha256 "f0114e874f333ad77a97b1f2eee586cc6595cc883520b7f74e18f10235edb599"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.5/cyguard-linux-arm64"
      sha256 "cbe4053e39a1e9e4bc9639e6c13771f55de56f6d6e26258d5097e78302e2901c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyguard/releases/download/v0.1.5/cyguard-linux-amd64"
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
