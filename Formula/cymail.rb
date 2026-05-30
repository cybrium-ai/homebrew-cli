class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.2.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.2.0/cymail-darwin-arm64"
      sha256 "27fe4433a40c2d6bd7ca696815f10553d9f9ac75e8b7320693821a0c495eb62a"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.2.0/cymail-darwin-amd64"
      sha256 "4dbc3bfab1230efa7294f615fb5327e4563f3dd3eb8e8e8411693e07ad64ad6d"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.2.0/cymail-linux-arm64"
      sha256 "81f2fb0f999c0c4611137841d33fb2a78f6b297b6b80452f1dba9058a8e13625"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.2.0/cymail-linux-amd64"
      sha256 "893050b3615e5bcff5a890b9abb4ea276da9634fb807ee17b27949dcaac707af"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cymail-darwin-arm64" => "cymail"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cymail-darwin-amd64" => "cymail"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cymail-linux-arm64" => "cymail"
    else
      bin.install "cymail-linux-amd64" => "cymail"
    end
  end

  test do
    assert_match "cymail", shell_output("#{bin}/cymail version")
  end
end
