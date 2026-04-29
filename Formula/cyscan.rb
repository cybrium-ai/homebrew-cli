class Cyscan < Formula
  desc     "Cybrium Scan — fast multi-language SAST engine"
  homepage "https://github.com/cybrium-ai/cyscan"
  license  "Apache-2.0"
  version  "0.8.1"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.1/cyscan_0.8.1_aarch64-apple-darwin.tar.gz"
      sha256 "a5777236333f64fc0c341734601df76905bd78e56f26967e4562b8f6d586d93b"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.1/cyscan_0.8.1_x86_64-apple-darwin.tar.gz"
      sha256 "d283cf6836e464b33cce1a8e6166674260b808016dc49e730139f441b6c9065a"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.1/cyscan_0.8.1_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "277cafc445a88d6077b0e0ca6b3cc9b7ba369089ca7cd8a12c8d539f9497a3ae"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyscan/releases/download/v0.8.1/cyscan_0.8.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba7fd32f3816858dfb46f897b677b49d1c0551a35242cde741beb66ba2f386ee"
    end
  end

  def install
    bin.install "cyscan"
    (prefix/"rules").install Dir["rules/*"]
  end

  test do
    system "#{bin}/cyscan", "--version"
  end
end
