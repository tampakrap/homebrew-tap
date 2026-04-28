class CrossplaneAT21 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "2.1.5"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "544dc9df40e6767c891c7d62365d0c4ec3ee22b11eea649dabd59abcd30ab4d0"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "1da8bd96a19b9e5944093ed05fea409e799ec68193191ea2ccccb611d6ec4b8d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "28dbf0142ec5fa016e6de989ce7d9f20f7150a7729be275ebfaf45daf3b4542c"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "2b5375e26975e2715567f626b11d31186f1fdaf28efb880aa65d91d695273817"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "a4645f3725d9840898d8cd7ec3f7f0cb2bdd748bd995584973c127a7e3500896"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    assert_match "Client Version: v#{version}", shell_output("#{bin}/crossplane version --client")
  end
end
