class XprinHelpers < Formula
  desc "Helper standalone tools used by xprin"
  homepage "https://github.com/crossplane-contrib/xprin/blob/main/docs/xprin-helpers.md"
  version "0.5.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_amd64.tar.gz"
    sha256 "31035dae65781c8c2f34569c34bb0e664a36274fcfa699cd06464d82fc77382c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_arm64.tar.gz"
    sha256 "cffbc7c29f647cdaaa15814e40afb8034baa80f80138253a0d37ea82d8b6f29a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_amd64.tar.gz"
    sha256 "bb068d1e7bde67d64d234fa9a3defe57bca622da61c0c8d6ac60e2be75052319"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm.tar.gz"
    sha256 "a9f71a13f38899fb64d21720ea3b90e7ee8b0220fc3d7689034d12abea90d5de"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm64.tar.gz"
    sha256 "4bb4d389daaf53946ef19386473b4f696fda8ed7b736869028e61e2d530f2af0"
  end

  def install
    bin.install "xprin-helpers"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xprin-helpers version")
  end
end
