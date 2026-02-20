class XprinHelpers < Formula
  desc "Helper standalone tools used by xprin"
  homepage "https://github.com/crossplane-contrib/xprin/blob/main/docs/xprin-helpers.md"
  version "0.1.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_amd64.tar.gz"
    sha256 "1ce754a61e8a5e5e694e5ba9da099815721a4ab64a0c0ddaeb4c179976c1e944"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_arm64.tar.gz"
    sha256 "fbfa4b1d689363c796a4f5ca50d3dfa7338aea94505d3988903b907ab06de102"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_amd64.tar.gz"
    sha256 "c1910dab83c3f73dfcc5286259fdb75fb467d3504002fcdae1393be650ac476a"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm.tar.gz"
    sha256 "0432a2f453c7c7e368c84889acd6792dbe87c4cbd77a5fcdf711f3bbee8813a1"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm64.tar.gz"
    sha256 "f6f750f1dad8aa4a99d9c913574a29bc38eee44855bfaec98363b14af0d7a8a5"
  end

  def install
    bin.install "xprin-helpers"
  end

  test do
    system "#{bin}/xprin-helpers", "version"
  end
end
