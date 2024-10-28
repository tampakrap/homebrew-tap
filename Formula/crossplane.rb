class Crossplane < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.17.2'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.17.2/bin/darwin_amd64/crank'
    sha256 '1ad07558ec426d881228a4f139245ce9cdb9e02715ecb6d8c8b9da7c5dbf541e'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.17.2/bin/darwin_arm64/crank'
    sha256 '477946613fd01fdef0b1ddea55271597c8b78f32969abc47b9c1b2be7c319cbf'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.17.2/bin/linux_amd64/crank'
    sha256 '256c1ea41eed5e22e2d9b38c68a072b95e4610d1903b833a2aab1fb03387d258'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.17.2/bin/linux_arm/crank'
    sha256 '0d834ef8457c59835d567049a60617f3e4408af846a16adad94d1af1ab94884c'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.17.2/bin/linux_arm64/crank'
    sha256 'a0415669363405c76ae5db22efe82641745115b09cf4ba6110398cb7df4665c5'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane version --client"
  end
end
