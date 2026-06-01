class Cymail < Formula
  desc     "Cybrium AI Email Security Scanner — SPF/DKIM/DMARC + reputation + leak"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.6.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.1/cymail-darwin-arm64"
      sha256 "9dc624eaeb5db01ae21957b27774b505027006a84d4687ca9738f4dd83b3cf19"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.1/cymail-darwin-amd64"
      sha256 "4bc77cf66d295ca3230ce53ff5ac97b797ebff48a05e31ab1e8bea35a2783d73"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.1/cymail-linux-arm64"
      sha256 "5d1b48aac554b688bc29554b6299b3da8f2793447cf5ad286ab53a5a7eb37489"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.1/cymail-linux-amd64"
      sha256 "2cedd5e295b5684ac21b7a956438504679094c821f673d89eb1cc2a4d40e224a"
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
