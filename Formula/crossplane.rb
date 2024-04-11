class Crossplane < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.15.2'
  license '???'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.15.2/bin/darwin_amd64/crank'
    sha256 '7449adba8fd74e0e6daa23b0726795293947ae2f022944c42ec0c02f4cf9b412'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.15.2/bin/darwin_arm64/crank'
    sha256 'e5c9ab45439e0c827f754bc84b2e47485c0758697f335fa95c519c7bb104a7d7'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.15.2/bin/linux_amd64/crank'
    sha256 '29bc4fdd990aefe90cb1aa8b63142104b65f6d1aa52825b360ce027b0b1bd6e8'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.15.2/bin/linux_arm/crank'
    sha256 'ed53fca78abeebc961c304ec8f331695a83e4c92b0054465137aa5e0397dd166'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.15.2/bin/linux_arm64/crank'
    sha256 '06a7aa5a7f606f879630722b283b7580e124b2a96c700890ba15f5d562a03e98'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane -v"
  end
end
