class Cysense < Formula
  desc     "Cybrium network passive sensor — traffic capture + protocol dissection"
  homepage "https://github.com/cybrium-ai/cysense"
  license  "Apache-2.0"
  version  "0.2.3"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.3/cysense-darwin-arm64"
      sha256 "3b1fb5f30cb7f3a3c34e784649f9c18182d7163905456aff4b9700490656436c"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.3/cysense-darwin-amd64"
      sha256 "649239bb03ce6b44dad6e434f80812ea1bc2f3f1da7f1d138fa5a26bc95fd93a"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.3/cysense-linux-arm64"
      sha256 "6048254864396190665beab85470b30f5a23ea5e134b3faf2b45d0bddec2bfcb"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.3/cysense-linux-amd64"
      sha256 "45162a95af70870a66d897bf470b55d2b1bf8fcdcc973be0828d2f601a5dcdf6"
    end
  end

  depends_on "libpcap"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cysense-darwin-arm64" => "cysense"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cysense-darwin-amd64" => "cysense"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cysense-linux-arm64" => "cysense"
    else
      bin.install "cysense-linux-amd64" => "cysense"
    end
  end

  test do
    assert_match "cysense", shell_output("#{bin}/cysense version")
  end
end
