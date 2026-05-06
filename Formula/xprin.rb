class Xprin < Formula
  desc "Testing framework for Crossplane"
  homepage "https://github.com/crossplane-contrib/xprin"
  version "0.2.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_amd64.tar.gz"
    sha256 "b3d9a806c1a6ec8306a585d594099a419e8b0d5a39b73d80551e4a8321a86cd2"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_arm64.tar.gz"
    sha256 "bb149d618d473d12017cd8e12626ceb23fc409125af6cb4e7f520800cc5f5674"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_amd64.tar.gz"
    sha256 "99e2fcf28e5868500c774eb043fea2cd2d0c96470fa239dfdd8a71a3519b1968"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm.tar.gz"
    sha256 "04d28c4a912d0289fd57c5ba2d2547334fbd603d50760e8b0b7f64041664cbec"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm64.tar.gz"
    sha256 "42483adef153ebd6eb0c845380f7126a5e3fce9cd5002d32a097408dc0da022e"
  end

  def install
    bin.install "xprin"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xprin version")
  end
end
