class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.4.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.1/cy-tls-darwin-arm64"
      sha256 "db02e46fde4e4ac93358371c20542c84acb5033cc132a3b0853050a021073048"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.1/cy-tls-darwin-amd64"
      sha256 "6e907650ce527c914c14865985d5d1bbdc2598c3fdfdac9a261697632de4b092"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.1/cy-tls-linux-arm64"
      sha256 "69e8733e788bd49c88c294768b5158fa5e8cd416d277baef604cf9dfd38f22fa"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.4.1/cy-tls-linux-amd64"
      sha256 "e57de928b5b2142941d7f9d3c957a1f791ab24fee2f6048a83018ee68109d832"
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
