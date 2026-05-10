class Cyweb < Formula
  desc     "Cybrium Web — fast web vulnerability scanner"
  homepage "https://github.com/cybrium-ai/cyweb"
  license  "Apache-2.0"
  version  "0.8.6"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.6/cyweb-darwin-arm64"
      sha256 "0e06265f226c9913b153651f4dc8c8304723a2065ed614f3134f739da505b7f4"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.6/cyweb-darwin-amd64"
      sha256 "92c0a2ec05b265323ea4d22e3471323451ebe0720c619623f7e17f54175a555a"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.6/cyweb-linux-arm64"
      sha256 "c421d82f022fd8592cb975c710702592f759db0c41f702eb40ff74e985fde529"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cyweb/releases/download/v0.8.6/cyweb-linux-amd64"
      sha256 "2987bb8410a9894028a35fb539d3d163eb7061edb7aedf0a0fa8ae301f64d4fd"
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
