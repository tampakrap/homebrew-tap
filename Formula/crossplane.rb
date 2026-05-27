class Crossplane < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "2.2.1"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "a600abd8990eef1464533c8e6db46313a30720a342a9f7785dd94fdbd6683f28"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "2b52b3f669a310ca7d84c70cddcea996d9f4eb88abebfa2b291ec200d43b43b1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "34cbcc0d3fe30d1ad38c64eaac3e0231ec06006ba492bafca4c2bf93973e41e9"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "802fc55ebfcba022af79fd40f249cfe0bd5e67eba43b1e11aecca8b73acefd3d"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "325f0c390da4d1d41bc38df4499b1b653905149135db95550da0a90e4814ef98"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    assert_match "Client Version: v#{version}", shell_output("#{bin}/crossplane version --client")
  end
end
