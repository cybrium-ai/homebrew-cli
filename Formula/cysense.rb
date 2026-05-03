class Cysense < Formula
  desc     "Cybrium network passive sensor — traffic capture + protocol dissection"
  homepage "https://github.com/cybrium-ai/cysense"
  license  "Apache-2.0"
  version  "0.2.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.1/cysense-darwin-arm64"
      sha256 "c8ce2e6c427eb58c0f8e9aef895fd16ee591d92f0de7f7b2e75e1c2fe4d03255"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.1/cysense-darwin-amd64"
      sha256 "2beaa0559f227ac7f9093432ac8601cd128e432b499e5e0ba218a605d5c5bbb1"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.1/cysense-linux-arm64"
      sha256 "a35363bc1767533e4b3efab3cbc3b17dda944ee69bc095e7d19fa681c21a88bd"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.2.1/cysense-linux-amd64"
      sha256 "d29b8b9850aaf549971f03198a3238bc0a9b1540d75693a90767a9849f5f17bb"
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
