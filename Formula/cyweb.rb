class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.12.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.12.1/cyweb-darwin-arm64"
      sha256 "21f4b8aba9048d65356af33a4a04b3660951f4edbcf0e7ffb4a27d8080c76d43"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.12.1/cyweb-darwin-amd64"
      sha256 "723cf54849a8da85b5d05ae16d2a52b64cc55bb483f70632a51456396d65df06"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.12.1/cyweb-linux-arm64"
      sha256 "69bb659ba3ce95bb37deed9babe23a69bf866a25e468c3f72e2b79d1242086c6"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.12.1/cyweb-linux-amd64"
      sha256 "ff4ea8cee7b3528419b36e389afbd2adafd9075b8594bfccbdfeb8b2dbd644cb"
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
