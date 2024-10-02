class CrossplaneAT116 < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.16.0'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.16.0/bin/darwin_amd64/crank'
    sha256 'e78e4b1c82934067b3c6fba03b3e6574c6f9e23854694273b280c04dc2de9574'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.16.0/bin/darwin_arm64/crank'
    sha256 '21e84fbd34a10af8fd9766049d1ca18ea7bc5cc5f62ce81e802e16d0a2d0987f'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.16.0/bin/linux_amd64/crank'
    sha256 'd81655071af89f34cadb07b09a081412bbb82d5a959f4e1e4ab32e8a50ae1843'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.16.0/bin/linux_arm/crank'
    sha256 '7aea42f6f065602246be381d6c34e05e217bf3b9de3fae45d6c445f60eecf88c'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.16.0/bin/linux_arm64/crank'
    sha256 'a3c77e77f89908089289f4920af9dfed3a27180c6c0fe9decccd9fc373f835c1'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane version --client"
  end
end
