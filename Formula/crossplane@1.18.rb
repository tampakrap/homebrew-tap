class CrossplaneAT118 < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.18.4'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.18.4/bin/darwin_amd64/crank'
    sha256 '3d7a5e0599b9f023b6320bc3c8a6e2a16de326adecd0bb7074c8da2bae702f25'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.18.4/bin/darwin_arm64/crank'
    sha256 '3d7a5e0599b9f023b6320bc3c8a6e2a16de326adecd0bb7074c8da2bae702f25'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.18.4/bin/linux_amd64/crank'
    sha256 '3d7a5e0599b9f023b6320bc3c8a6e2a16de326adecd0bb7074c8da2bae702f25'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.18.4/bin/linux_arm/crank'
    sha256 '3d7a5e0599b9f023b6320bc3c8a6e2a16de326adecd0bb7074c8da2bae702f25'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.18.4/bin/linux_arm64/crank'
    sha256 '3d7a5e0599b9f023b6320bc3c8a6e2a16de326adecd0bb7074c8da2bae702f25'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane version --client"
  end
end
