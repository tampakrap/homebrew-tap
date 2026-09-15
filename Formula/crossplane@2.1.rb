class CrossplaneAT21 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "2.1.8"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "3f6c20369c9d9b7902e6c681ed68d13b9ece6fefc60bb91c6334be42b4f2ac27"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "5e1d75dead7129e5021d6049f61103a9d00b7053821dfdda0740873e240098cd"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "93d7fa11c57f5d0694e122b4deb31265bacfb9f0a036b0eec4b8de0d6063d765"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "d500ef16bb309c66f7d5e83eb34128feb4f3b2f229aed465968e361281f8c3e5"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "1c4d37a0f113043c6fbeb27afaeaea63713a706bc8044af88ed0ae4cf083207d"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    assert_match "Client Version: v#{version}", shell_output("#{bin}/crossplane version --client")
  end
end
