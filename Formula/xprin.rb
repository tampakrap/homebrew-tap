class Xprin < Formula
  desc "Testing framework for Crossplane"
  homepage "https://github.com/crossplane-contrib/xprin"
  version "0.3.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_amd64.tar.gz"
    sha256 "32a64d66e70062bca581a1a7b92b6e1febe9d25b989bdfae6582806da54301b8"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_arm64.tar.gz"
    sha256 "01ba57f7861402a77a1000a73ee40ddbaec90e9cdba930f7da021162ec6f95ae"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_amd64.tar.gz"
    sha256 "88d2d3a4932c247239d693a5de2320a33d1cc863d1ffbcf499633f7bdb5602ef"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm.tar.gz"
    sha256 "e1f290a052e8dbfee928402a90f61c083de29710d5000dd5df405b85cee1ea8f"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm64.tar.gz"
    sha256 "c95e5f2aa7173008bc025755036e490c9cbe91caabbd82698c72275ebc6e96ec"
  end

  def install
    bin.install "xprin"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xprin version")
  end
end
