class CrossplaneAT114 < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.14.9'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.14.9/bin/darwin_amd64/crank'
    sha256 '058c5b49313ff3c47f10756a2c95310a7712e2b76c0c0b51b3b777fc6d579fe2'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.14.9/bin/darwin_arm64/crank'
    sha256 'f3d99208310749c92f732a1fe24436b1268b3fa32cfe97dca85d52194774e777'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.14.9/bin/linux_amd64/crank'
    sha256 'bd429f94668eb65dba6cf2e9967667bb920e2b32e7da327047c1d26ddddc51ba'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.14.9/bin/linux_arm/crank'
    sha256 'ff9196929a270a1a1b6e78f418e57fa379e5500d4efc4dbfb1384e3ecce922dd'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.14.9/bin/linux_arm64/crank'
    sha256 '85c9574fb4e9890bafe83ebba475cef41d48e40aaaba93dcfd67ed569b4810cf'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane -v"
  end
end
