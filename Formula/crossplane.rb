class Crossplane < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.17.1'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.17.1/bin/darwin_amd64/crank'
    sha256 'cf89f8db2fdebf41362e7f2da82080652d5b768327297101fefda756a61969ba'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.17.1/bin/darwin_arm64/crank'
    sha256 '71b135cb69d75a6bf62d5f6132453a26f1cedc6968ebe82189b5c716c1cfd884'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.17.1/bin/linux_amd64/crank'
    sha256 '0eb8cbf5f7261343c70f3cad7e5697359d4e2bcb2fb5e7d9dff3d772d068b37f'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.17.1/bin/linux_arm/crank'
    sha256 '21a890a0b5dd8fcc6f6f3442bc020cab6ad29ebbb816f8594a7c0f685366dc98'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.17.1/bin/linux_arm64/crank'
    sha256 'afaa68b424c4813869b594582b32ba418c8c2fbc7bf152ff40e983b0f0026018'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane version --client"
  end
end
