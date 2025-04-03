class CrossplaneAT117 < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.17.6'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.17.6/bin/darwin_amd64/crank'
    sha256 '9e0c7d7f35bc4b0254f3d6960f3254a5f5680219c8ee5389362a6bb3291be757'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.17.6/bin/darwin_arm64/crank'
    sha256 '9e0c7d7f35bc4b0254f3d6960f3254a5f5680219c8ee5389362a6bb3291be757'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.17.6/bin/linux_amd64/crank'
    sha256 '9e0c7d7f35bc4b0254f3d6960f3254a5f5680219c8ee5389362a6bb3291be757'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.17.6/bin/linux_arm/crank'
    sha256 '9e0c7d7f35bc4b0254f3d6960f3254a5f5680219c8ee5389362a6bb3291be757'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.17.6/bin/linux_arm64/crank'
    sha256 '9e0c7d7f35bc4b0254f3d6960f3254a5f5680219c8ee5389362a6bb3291be757'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane version --client"
  end
end
