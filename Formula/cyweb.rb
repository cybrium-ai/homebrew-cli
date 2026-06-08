class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.12.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.12.0/cyweb-darwin-arm64"
      sha256 "18939bbee9310065269be85f019539ec4d8e7943fcd8240147322d99b3a1182b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.12.0/cyweb-darwin-amd64"
      sha256 "125ef6ab6ef2b6b91c014f7746333cb1b8a7e8ee88be594e63c4a9b3fc8e4ce6"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.12.0/cyweb-linux-arm64"
      sha256 "5766f9aec49e95b4b6262b2847126130d1307d2535d42f5594431be45a51af18"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.12.0/cyweb-linux-amd64"
      sha256 "30de68a4545c06772b2be3f9497f083f7538d82ed3872d7496ab201adba30186"
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
