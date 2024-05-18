class Crossplane < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.15.3'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.15.3/bin/darwin_amd64/crank'
    sha256 '398008bde67a56780443c359d4de4819fdd105a7a30235b9922040b1d6ab9044'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.15.3/bin/darwin_arm64/crank'
    sha256 'b25cc106ed6e563b82af736ccc0632b210bf7af5c5a2e1d98d4bef31c25f2f6a'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.15.3/bin/linux_amd64/crank'
    sha256 '59f90a1484a3c0acae74a692c9aad6672b4eb609d0ef06954aa35e60949ca817'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.15.3/bin/linux_arm/crank'
    sha256 '12f01d6ca03d87fa28bb28b987104027b1c53e074822401f0f2270306972030a'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.15.3/bin/linux_arm64/crank'
    sha256 'ba69ff2475a3d242e081918e010776fc150e0fcbf8610b468a42a397327a8406'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane -v"
  end
end
