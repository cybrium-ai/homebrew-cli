class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner (Nikto replacement)"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "MIT"
  version  "0.7.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.0/cyweb-darwin-arm64"
      sha256 "1be0e5ab4e9bc6f64668188004ac83e57ca1e0b505a8feed823448799db62637"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.0/cyweb-darwin-amd64"
      sha256 "0dbcea0dfbf02f485e610a7442108bd48b51070f59111c8b1cd4132e7dd48152"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.0/cyweb-linux-arm64"
      sha256 "8545574d8def86a6717e4c114f8fe9edf538ee21971dff6c91d7ada0cd7f34bc"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.7.0/cyweb-linux-amd64"
      sha256 "4c7df394386eafa375d2cf6731d5d6ed0acf3951059b02293bac08f82a6a8dec"
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
