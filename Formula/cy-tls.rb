class CyTls < Formula
  desc     "Cybrium SSL/TLS posture scanner — full probe suite, HSTS preload lookup"
  homepage "https://github.com/cybrium-ai/cy-tls"
  license  "Apache-2.0"
  version  "0.5.40"

  on_macos do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.40/cy-tls-darwin-arm64"
      sha256 "ebc488b861d96a405ea40c3c06b0e5a7d58fdc4981f90e18ca86cee441d9e7d5"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.40/cy-tls-darwin-amd64"
      sha256 "c798be82e254d273eb39cb184fb883c4bd5a70af744fd5e441ebbd61548a40b9"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.40/cy-tls-linux-arm64"
      sha256 "42e25805cb243e8108e68ece14bc52ceb6e76d582e7487bedebc180094406a46"
    end
    on_intel do
      url    "https://github.com/cybrium-ai/cy-tls/releases/download/v0.5.40/cy-tls-linux-amd64"
      sha256 "3da090d078769471efe42c1cd131a3f154c561af307dddcfaf54a07e31f8ea07"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cy-tls-darwin-arm64" => "cy-tls"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "cy-tls-darwin-amd64" => "cy-tls"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "cy-tls-linux-arm64"  => "cy-tls"
    else
      bin.install "cy-tls-linux-amd64"  => "cy-tls"
    end
  end

  test do
    assert_match "cy-tls", shell_output("#{bin}/cy-tls --version")
  end
end
