class CrossplaneAT20 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "2.0.7"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "70418a6fe2c8c462c40586e1ae1fe3492a34f758f36727cd3dd851093a81b889"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "f9503dd3a73f964c5996e55691d109eebedc1d8c257331bc55c87ad472e669a8"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "403e1efb845ccb0d8e8e520dfa64ab6c760e3fb1085def692edbc75ebf72e576"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "42b36a86d29f2b439b99f7c349b8d2213926e08f707c1e22c7c7a64a47d0d472"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "76ecce5f395d45df2a564b1c43fc1e8d16a7693c562d4a9b382e0859907c80fa"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
