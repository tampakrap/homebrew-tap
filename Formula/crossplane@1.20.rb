class CrossplaneAT120 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.20.3"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "8ef695d8c55f283fd1466aa51a6a969c8ad155eb5ae87dc7c65c3a25e59b8e36"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "809a40308fb2c8356d7e7836c2425e4cd37edfab546588e895dfa66544e2e90c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "cab8eb919a40642d7194754af392cc065b8a9add2ba879eac1db84cf4742d909"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "185db9969e2cf0967646c01b35be369cf4f9d559c2d92f395c00d8ba3a23c889"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "0255d0f7723d590d3f579030c533ea39d63adeac3aaf0f2150b911795c002794"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
