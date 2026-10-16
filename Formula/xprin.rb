class Xprin < Formula
  desc "Testing framework for Crossplane"
  homepage "https://github.com/crossplane-contrib/xprin"
  version "0.5.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_amd64.tar.gz"
    sha256 "8ced2d2efc57a92320e0a074156619f85e184f44b31b3eb4f29ea54573696258"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_arm64.tar.gz"
    sha256 "344e2458665ef99f4067cf8e011490ef7d99db48d6ce01e365732e53a75a6a03"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_amd64.tar.gz"
    sha256 "df3db32e705a5ec374124e2bbb83c16dd07c3791920c87b2deeedf5573b0660f"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm.tar.gz"
    sha256 "bc3d373d6a29049d4d7f16bdd8ee5acfe86d4181fbed2430cf84d62fe286c460"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm64.tar.gz"
    sha256 "6d83a75b5a8fa36c6966e3f2e144d3abd9e23a3f25c021e9ce0b4614a699f993"
  end

  def install
    bin.install "xprin"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xprin version")
  end
end
