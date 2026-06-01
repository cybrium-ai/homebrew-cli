class Cymail < Formula
  desc     "Cybrium AI Email Security Scanner — SPF/DKIM/DMARC + reputation + leak"
  homepage "https://github.com/cybrium-ai/cymail"
  license  "Apache-2.0"
  version  "0.6.3"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.3/cymail-darwin-arm64"
      sha256 "e6d514e11ca26e14b3605f4b1fd7a2e0f1d6ad6ae93efcbd262bcd8ab838ed53"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.3/cymail-darwin-amd64"
      sha256 "e70f97ee7440b37c4d00a03fd7f6ec0eb57fa7633735d30daf071a3a77a853c6"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.3/cymail-linux-arm64"
      sha256 "1455decf9222086d7b9ec4878dbaaa28927dcc9c5add63195a57a0f299f514a5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cymail/releases/download/v0.6.3/cymail-linux-amd64"
      sha256 "3778dd3e3e29256e593019ea551945ca82d896086603e6ed190da0abc5c17b65"
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
