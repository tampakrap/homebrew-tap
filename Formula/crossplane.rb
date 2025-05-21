class Crossplane < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.19.1'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.19.1/bundle/darwin_amd64/crank.tar.gz'
    sha256 '0d0719bc8201dd5ec5adec900b6dd6937f03a09357d26af093472303c14c046f'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.19.1/bundle/darwin_arm64/crank.tar.gz'
    sha256 '9dd83e730ce8263254c244806ccf02cc142f98b64fc0283e8d2820042e1de396'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.19.1/bundle/linux_amd64/crank.tar.gz'
    sha256 '14a7af3c86c2f5d299fea4ede51d2306a1f4b730fb8d0beb3ea50c54bd19ad26'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.19.1/bundle/linux_arm/crank.tar.gz'
    sha256 'af72d4d8b0d72b3f2454dc684465651aadcf2f5b731786297952a4d7265d7a2a'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.19.1/bundle/linux_arm64/crank.tar.gz'
    sha256 'f7d42f09bee1b97b21d7aefcc97c12d10a1d4a2dc9794752937ec86a6f792c3b'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane version --client"
  end
end
