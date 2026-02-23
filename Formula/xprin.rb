class Xprin < Formula
  desc "Testing framework for Crossplane"
  homepage "https://github.com/crossplane-contrib/xprin"
  version "0.1.1"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_amd64.tar.gz"
    sha256 "ab640b364008363e584da1c7bd997006cac633b02a8a4632bc2f245cd8d25960"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_arm64.tar.gz"
    sha256 "3b2e27002c3c4dea2b464c8dd06b322fe8797c0f212d3b11b899f1db23e434af"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_amd64.tar.gz"
    sha256 "c17e3cdb9011ad56853115c6378ccca3825616f292d6c8f1205ffedb87cdcf32"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm.tar.gz"
    sha256 "44fa546be4323c85f08ab24c2a770c50fd74abd259d913314be3ad2fa4f50cf7"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm64.tar.gz"
    sha256 "00feeba70b89fab1cb1358edf54150c76b432684a78ad8b3d55e4670704022d4"
  end

  def install
    bin.install "xprin"
  end

  test do
    system "#{bin}/xprin", "version"
  end
end
