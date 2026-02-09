class CrossplaneAT120 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.20.5"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "13031d87dfbf50284cbb303c21abb68b6f6da48d183b1de62e1a3e1fb05a1ee0"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "fe36a1999a1e3691b5aad7736401c868c635a9bdf47151295bc841ddb5a0b0a5"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "4474b41d5b3a655367b551463b21b2cfe2e9bdcc9617740277f729ee87e0c078"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "ca35df5cf4b7a19fdcc42200fb6ac88003ccf45db18e5dcc6a9c5868a364c6fb"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "81dc8d3531b74e1a6eb9821980cd391d6df1695ead46e486b5333baeeee844d1"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
