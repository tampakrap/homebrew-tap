class CrossplaneAT116 < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.16.3'
  license 'Apache-2.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.16.3/bin/darwin_amd64/crank'
    sha256 'e346641a1ba2bce2fc679a5565c13962c3725deee86c52462e4b909296720245'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.16.3/bin/darwin_arm64/crank'
    sha256 'ead0cf7c865c713432a3490bca4592663647d6d58251b1f3fa69daa33aabf7eb'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.16.3/bin/linux_amd64/crank'
    sha256 '89b0e81fa95076fefe519e2788502a1c03b3064eedeebd35a8c62d38070ee9fd'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.16.3/bin/linux_arm/crank'
    sha256 '8c58d4e520e5faf16e4b7cd959c0e7754805f5ab055d9721f86041188d003329'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.16.3/bin/linux_arm64/crank'
    sha256 'cd77f50df091ffba7eebd3271db43183ade2cd9d622793782d3662c0bc107836'
  end

  def install
    bin.install 'crank' => 'crossplane'
  end

  test do
    system "#{bin}/crossplane version --client"
  end
end
