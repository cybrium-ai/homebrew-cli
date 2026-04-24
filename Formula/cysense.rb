class Cysense < Formula
  desc     "Cybrium network passive sensor — traffic capture + protocol dissection"
  homepage "https://github.com/cybrium-ai/cysense"
  license  "Apache-2.0"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.1.0/cysense-darwin-arm64"
      sha256 "dbc8c2992a57e9c98282a8bfbb665fc0a0cd1fa81d74bc9e1fa69a556c2aef2f"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.1.0/cysense-darwin-amd64"
      sha256 "865b1a8c9cae6a46cc5dad189c5b27bace15a3c66878e2aae3a375128db9db09"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.1.0/cysense-linux-arm64"
      sha256 "ca2d36a6945c6f42776d7397fe18425124e0324c9c22d348510df60ba6ab0041"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cysense/releases/download/v0.1.0/cysense-linux-amd64"
      sha256 "3f5e495e740231e7bf4f8cd9056e9b5f60b9760b7d16711beb42e804914f724c"
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
