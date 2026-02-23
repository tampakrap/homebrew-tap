class XprinHelpers < Formula
  desc "Helper standalone tools used by xprin"
  homepage "https://github.com/crossplane-contrib/xprin/blob/main/docs/xprin-helpers.md"
  version "0.1.1"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_amd64.tar.gz"
    sha256 "23873d4e0abab0e9487b7639cd6263b113962d59458b6edf1192ed9361a03ed9"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_arm64.tar.gz"
    sha256 "360110b972604c2e4e9faf4a80ef3eea86d67372eb8246f84ab1ad8c5708e175"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_amd64.tar.gz"
    sha256 "bcd452ae510c62e5ab0472c5959778ee4a0864c77a4c296753f421a715f9d3fd"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm.tar.gz"
    sha256 "15cfabd0a5468e40fb8531edec9f6786b916f70724cfc5fb3417721759626573"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm64.tar.gz"
    sha256 "ef1c1c2eb1640f39fc5391e4d73031b7247acab37dccca4e8c067eb406addd79"
  end

  def install
    bin.install "xprin-helpers"
  end

  test do
    system "#{bin}/xprin-helpers", "version"
  end
end
