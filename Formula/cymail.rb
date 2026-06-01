class Cymail < Formula
  desc     "Cybrium AI Email Security Scanner — SPF/DKIM/DMARC + reputation + leak"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.6.4"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.4/cymail-darwin-arm64"
      sha256 "dcaae88dccc1257607eca874a3adc248db1a08c4b5fcef4e2a3726b070495638"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.4/cymail-darwin-amd64"
      sha256 "968034dd587ab5034768f0bcfe55259eb987ca5c3a51a5e2b173969865ed7c6c"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.4/cymail-linux-arm64"
      sha256 "f174410f078aaee3d11c82ce1c2263729f069cd733a135cb14aa4bb79a79bd57"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.4/cymail-linux-amd64"
      sha256 "cd4bdfde00703ca0561eb779262e0a836a6e530cedb2c1f5b635c435a66e3ea8"
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
