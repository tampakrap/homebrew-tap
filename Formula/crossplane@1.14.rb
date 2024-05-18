class Crossplane < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.14.8'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.14.8/bin/darwin_amd64/crank'
    sha256 '5282642d45f2832e7bb1f72c742f63ad31af514ce8d11cca0dc34908bdf93f40'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.14.8/bin/darwin_arm64/crank'
    sha256 '9da5d67d6e33e6e5834b0a25fd7bec453a016d13eecfec21cc3a7102176a6092'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.14.8/bin/linux_amd64/crank'
    sha256 'fb5484847a484cd3f365d2ba2f1b75ab93434f7f3e560236b57d9dda175bcdc0'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.14.8/bin/linux_arm/crank'
    sha256 '606c9e108e284a42f27c2d90763fb02b10d137d4772c1fb3f81ca01920e6b1d5'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.14.8/bin/linux_arm64/crank'
    sha256 '152eb71a0d789d6d264b2148c390c51d77131f530421ff9128391fc9be4853a2'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane -v"
  end
end
