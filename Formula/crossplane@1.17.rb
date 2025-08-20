class CrossplaneAT117 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.17.6"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bin/darwin_amd64/crank"
    sha256 "18406c1364961c23627650ac4b848c0cb2b1164a7c9243f302bb54ae65fe6585"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bin/darwin_arm64/crank"
    sha256 "78a3a61ddf300904d523e7b61bcb1a22498681e96abf0abfe856ce3c1550264f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bin/linux_amd64/crank"
    sha256 "cd927525c29666fbff9f722642919f4afb392a9e21da7dffc0244f330df91562"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bin/linux_arm/crank"
    sha256 "a98819492c586910962993cb031b8aea6941aaa52b202dffcca9a5b9fa96f246"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bin/linux_arm64/crank"
    sha256 "9e0c7d7f35bc4b0254f3d6960f3254a5f5680219c8ee5389362a6bb3291be757"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
