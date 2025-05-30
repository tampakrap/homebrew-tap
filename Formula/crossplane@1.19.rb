class CrossplaneAT119 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.19.2"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "40a19ad04a387a49dd20aa801532b6ac7c90253ede67fc9f39e5e46299891aa8"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "20a4c06f531b14aec65b7429bea8e7dfd777842d867a5a4cd2f2d5e173c5a6cd"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "5cabb551ebf6231eea9279660a8047a1b81e309783af8f2e27f68cdfc487fff4"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "4042202da4a3849845604bbe2019bddac397c6d7f83d1f6db0f2f3c26acce9ee"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "e0c8975ff0ef14624d4cb0746e909c64351edd899fb4510adb15eddfe7521413"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
