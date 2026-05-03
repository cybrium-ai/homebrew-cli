class Cydevice < Formula
  desc     "Cybrium Device — host-side compliance posture agent for non-MDM environments"
  homepage "https://github.com/cybrium-ai/cydevice"
  license  "Apache-2.0"
  version  "0.2.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cydevice/releases/download/v0.2.0/cydevice-darwin-arm64.tar.gz"
      sha256 "5def18ece4bf93bd7a6d8913059576e1eee525cb4c122334a4ab4c26af6b1e10"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cydevice/releases/download/v0.2.0/cydevice-darwin-x86_64.tar.gz"
      sha256 "4dc9854fce8dfe575d71872d1cdcba98eb46739eaca0fb3342a2a240b7fc6cb2"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cydevice/releases/download/v0.2.0/cydevice-linux-arm64.tar.gz"
      sha256 "c9bc2514606d4afd814cb5fb5b60b7b0916c0aa8f35090d4ff12f09ab6271688"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cydevice/releases/download/v0.2.0/cydevice-linux-x86_64.tar.gz"
      sha256 "12aaabc893abd341dc6c91892183634cfe6fe103d6263367d2c0435d8de6648e"
    end
  end

  def install
    bin.install "cydevice"
    # Ship the launchd / systemd templates alongside the binary so users
    # can wire daemon mode without re-downloading.
    (prefix/"dist").install Dir["dist/*"] if Dir.exist?("dist")
  end

  def caveats
    <<~EOS
      Enrol this device with your Cybrium tenant first:

        cydevice register \\
          --url https://app.cybrium.ai/api \\
          --api-key <token-with-scan:upload>

      Then start daemon mode (every 6h check-in):

        # macOS
        cp #{prefix}/dist/ai.cybrium.cydevice.plist ~/Library/LaunchAgents/
        launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/ai.cybrium.cydevice.plist

        # Linux
        sudo cp #{prefix}/dist/cydevice.{service,timer} /etc/systemd/system/
        sudo systemctl enable --now cydevice.timer
    EOS
  end

  test do
    assert_match "cydevice #{version}", shell_output("#{bin}/cydevice version")
  end
end
