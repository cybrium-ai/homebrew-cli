class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.11.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.11.1/cyweb-darwin-arm64"
      sha256 "c70c9facf36b033a11e54529eececf52867e1ce1eda9c636ce5afbb85b8454ff"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.11.1/cyweb-darwin-amd64"
      sha256 "9c39659c52ef9d9711fb437655ce5b777f32c8650551fce88d56b28ced3e010d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.11.1/cyweb-linux-arm64"
      sha256 "d2c8ac780456c6e7b1deb616258d31f3d2fdd16bc52daa984e4c61a1f2be7706"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.11.1/cyweb-linux-amd64"
      sha256 "4e1188830baa346e8aa82eacdde11c288b2c0e7fb914478321727a7047f2dccb"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cyweb-darwin-arm64" => "cyweb"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cyweb-darwin-amd64" => "cyweb"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cyweb-linux-arm64" => "cyweb"
    else
      bin.install "cyweb-linux-amd64" => "cyweb"
    end
  end

  test do
    assert_match "cyweb", shell_output("#{bin}/cyweb version")
  end
end
