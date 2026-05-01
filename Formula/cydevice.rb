class Cydevice < Formula
  desc     "Cybrium Device — host-side compliance posture agent for non-MDM environments"
  homepage "https://github.com/cybrium-ai/cydevice"
  license  "Apache-2.0"
  version  "0.1.0"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cydevice/releases/download/v0.1.0/cydevice-darwin-arm64.tar.gz"
      sha256 "e804fc9422f8e92307921e1125cfd1be535fea769e6b43957750331c83c81b30"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cydevice/releases/download/v0.1.0/cydevice-darwin-x86_64.tar.gz"
      sha256 "21bec976203459bacafb33256ca0ee2cd669842420f6b36a391ac87d150c5016"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cydevice/releases/download/v0.1.0/cydevice-linux-arm64.tar.gz"
      sha256 "a3039dce559f4aec6cddff2a0d064181846d8993ac9f142a99b5cfd5c4b97860"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cydevice/releases/download/v0.1.0/cydevice-linux-x86_64.tar.gz"
      sha256 "1c069b1e4b05f95824e8ab4b18571750a115e84904538e1eac55b8d6625c9439"
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
