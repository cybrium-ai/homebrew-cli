class Cysense < Formula
  desc     "Cybrium network passive sensor — traffic capture + protocol dissection"
  homepage "https://github.com/cybrium-ai/cysense"
  license  "Apache-2.0"
  version  "0.2.4"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.4/cysense-darwin-arm64"
      sha256 "fe8e904986304bc85e3b4c2b086d7a475c34e49290982345c7bfe327708bb20f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.4/cysense-darwin-amd64"
      sha256 "a7b3e4089e74d9b36fd322e1a036b133543db7790fba65ca512d70c961092e56"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.4/cysense-linux-arm64"
      sha256 "d81446c5b3919eeb9d9e820dd759d556c9d0c8ac6a550f052287af68af31c6d0"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.4/cysense-linux-amd64"
      sha256 "dc9f46061e2b5270862048d1011bbf48490d9ca9e6135a80bc46b65fa033ae4e"
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
