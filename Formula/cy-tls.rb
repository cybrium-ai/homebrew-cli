class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.2.11"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.11/cy-tls-darwin-arm64"
      sha256 "21275aa1241c366e5677cf2be1b0495698ba18301a5c092781d73bdd44187a06"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.11/cy-tls-darwin-amd64"
      sha256 "71e042b3a9d0fef6997c422e4043fc83de4afc262b8d7b1bfdce009f92d9e255"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.11/cy-tls-linux-arm64"
      sha256 "7642c4afb1e5a74ce05b2971cefd731bcf6d4c3010e6f8b1d5671502236941eb"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.2.11/cy-tls-linux-amd64"
      sha256 "c2a5f6fa0862ba9f5a22177275c53301f447994f5f182d936faf8b2fcf14149d"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cy-tls-darwin-arm64" => "cy-tls"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cy-tls-darwin-amd64" => "cy-tls"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cy-tls-linux-arm64"  => "cy-tls"
    else
      bin.install "cy-tls-linux-amd64"  => "cy-tls"
    end
  end

  test do
    assert_match "cy-tls", shell_output("#{bin}/cy-tls --version")
  end
end
