class CrossplaneAT118 < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.18.4'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.18.4/bundle/darwin_amd64/crank.tar.gz'
    sha256 'ad3048b2df8b00d5f6b57f1d7b4e1b61da74c454fe3044eb3b185b8816a7a160'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.18.4/bundle/darwin_arm64/crank.tar.gz'
    sha256 '3811e166bfbfc200b240201b827fda9acdb2bb657ff057374e75958e72bdda05'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.18.4/bundle/linux_amd64/crank.tar.gz'
    sha256 'e530aab83cce5c935624d27cb961493245be19771e0caf2d10711c8aceb9e5a5'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.18.4/bundle/linux_arm/crank.tar.gz'
    sha256 'd9a8bf3b095295a1ae0bc0e1a8a1a7a05668848eb7925cd139c808c44de21921'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.18.4/bundle/linux_arm64/crank.tar.gz'
    sha256 'f0a073a3e4a688d238a66ef531d7e6e535a5d07a2416e3efaa4fbd601cb41dfb'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane version --client"
  end
end
