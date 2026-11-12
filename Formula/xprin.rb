class Xprin < Formula
  desc "Testing framework for Crossplane"
  homepage "https://github.com/crossplane-contrib/xprin"
  version "0.7.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_amd64.tar.gz"
    sha256 "62e321d2042e105656f0e3759459164522db12771272097826c0629b6045c3f9"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_arm64.tar.gz"
    sha256 "c1ca5013ca4fe769b8ebbb5d3c264cd9b2a8df1aaee7e5ee145a9e79a395280c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_amd64.tar.gz"
    sha256 "4a914b38837bfc9e6f76374e7f7bcab0cdea7c12cc824d52f543cb789e4e1f0f"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm.tar.gz"
    sha256 "3df0a08e3b032451b131664f8b1afd04358e255311aa65cccf83546ed152efed"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm64.tar.gz"
    sha256 "807526e83ed9fee7324379f30e9bc884d9d9cf4309df3728dbb5997c57e523f4"
  end

  def install
    bin.install "xprin"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xprin version")
  end
end
