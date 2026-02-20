class Xprin < Formula
  desc "A Crossplane testing framework"
  homepage "https://github.com/crossplane-contrib/xprin"
  version "0.1.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_amd64.tar.gz"
    sha256 "32a9091bffd276c856c0cdda7c5d959333aa565c251aba069128105585cf5316"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_arm64.tar.gz"
    sha256 "bf98a3f2bc574406257203bcaa15133c01cf5f86a8748b2754b585742389def9"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_amd64.tar.gz"
    sha256 "1ca1a6293a0a7d843d2db6c20aa3f09fd56182af25721dbf5de4b3c53c444b96"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm.tar.gz"
    sha256 "e48cea7c32fd5d2221c0e0e59bbf4b7a3b4f39257c4936ccff71bb9268c9839e"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm64.tar.gz"
    sha256 "0ae6099ee1b43964cbc3e944ac98abd4bc2981e9135a42f624289cacf9df0196"
  end

  def install
    bin.install "xprin"
  end

  test do
    system "#{bin}/xprin", "version"
  end
end
