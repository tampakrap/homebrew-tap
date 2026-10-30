class CrossplaneAT120 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.20.14"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "0128c85f33da24928beac6a8567ae463a93422cc3a2a7e2b3c6fb44fd72c52a5"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "34c001fac65bce23dda9871806944649a73e24480a5533401c13295659ac9ed1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "aba2d4ecdde3f4253c2aac41f848381bf209dbf0c6d1b17a80a433263b7282da"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "57e4f79f8d8d310a1db9afe077976715bead399b10f844a0e105c22821d82438"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "b5668b6f2bfdafb9a5ef902aca31fd86dc18624e71cd06ef777c10199fd5912c"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    assert_match "Client Version: v#{version}", shell_output("#{bin}/crossplane version --client")
  end
end
