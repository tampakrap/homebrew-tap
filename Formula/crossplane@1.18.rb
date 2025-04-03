class CrossplaneAT118 < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.18.4'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.18.4/bin/darwin_amd64/crank'
    sha256 '89b960f5d632f8313953b0dfb81f87a6e9696b7d0a7543b01a36af960e862855'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.18.4/bin/darwin_arm64/crank'
    sha256 'fb104316decf1fcbe96912f178c7d06b75dd851eddb7d573cc582d91239ccb6d'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.18.4/bin/linux_amd64/crank'
    sha256 '76834afe3ed6baed05e36102e403f7faf25cc42ac3b7b380c82941cf17fdf8bc'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.18.4/bin/linux_arm/crank'
    sha256 '1220bc5f02e429eec91789048a58138b94ddaf6afe2a702d7c509928d93cb266'
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
