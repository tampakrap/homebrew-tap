class CrossplaneAT120 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.20.4"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "6a966c57dceec6cbcb59b1d57fc8a241b1f0fb7913121b82ce39a3dfaf31ad98"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "11c224364a85966f8ef04e0ab53297706453454ae831cad94b8537ce22273461"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "57ecd85bef58cf5c124462c238651ba2616d88df52eb1b798483f4a415b34d12"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "dc86ab6d310e51168e63041dafd114264beb09332d11298cdf42e1196e218d99"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "04bb58282e442e1cb4d90a9a8f759edbb01dbbb2fdbbcf3af27d4bbf44cd257c"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
