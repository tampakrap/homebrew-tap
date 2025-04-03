class Crossplane < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.19.1'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.19.1/bin/darwin_amd64/crank'
    sha256 'e90d4d3e2d3e7bdcb85427c6e833e71b15319f2d71daac8a5fa19a4660f52ab2'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.19.1/bin/darwin_arm64/crank'
    sha256 '642f688dbe417322eb3411f7b29f2bd2a085ba73e7a525e998b7250e1d56303b'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.19.1/bin/linux_amd64/crank'
    sha256 '04b1a2e323d31b2ebd0a24faa0e0b4988ba41c0b84e3c6adcadcf6cd0b0ebbc6'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.19.1/bin/linux_arm/crank'
    sha256 'c4ef92bc23d3801843b552f69554b4ac8093cfb56c2a76652d8ca147b33cf5e8'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.19.1/bin/linux_arm64/crank'
    sha256 'f7bd213fbc6219891437a5930d3ebad6e265c2639c05b2888b868476a93c1257'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane version --client"
  end
end
