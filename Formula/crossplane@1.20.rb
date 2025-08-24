class CrossplaneAT120 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.20.1"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "130bfcb44d40fb5da924c859ca1b1397a2a9be0e0a272a6c816b112be5d2ff44"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "db31604bc2d645307ec9c12cf2caa65e86e9a27fc57f74171c7265a3e5178f96"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "9987f2b42c4f1a5fbe26e2b1dc44ba2877589121e76161bbb1d80f38ad850b1f"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "7963937ffa90f94c9ac03306710d5b0fec1231d6ef3a0519e47457e460fce87f"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "7e1eb7602e41c3d87061b5257b30154b795ea29ad6182b2ecdd7257e0b736452"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
