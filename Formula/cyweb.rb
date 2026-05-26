class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.10.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.10.1/cyweb-darwin-arm64"
      sha256 "cfb239794b58c4d4e1fd2d93512506813ec6ddb43b01bbd92229285dae9eb413"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.10.1/cyweb-darwin-amd64"
      sha256 "f2c0b7e00ae367133720b500a888c2f6d2d6e5754fca4440c6656ded8aee4bb2"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.10.1/cyweb-linux-arm64"
      sha256 "e3059284212c9b16348aa2134fc64bf1e92f0e3c167a265e98d1d06eb48be3da"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.10.1/cyweb-linux-amd64"
      sha256 "c4a4856c0341ca1f8d83821538570adec0bd8d162969c49c2dff516d317d0a52"
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
