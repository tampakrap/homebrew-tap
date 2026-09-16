class CrossplaneAT22 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "2.2.6"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "9f8dc0349106ba0117ed0e3ac5fbf7f953f9f4b92cb72406c025b3eaac082dc2"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "588d052bdb9433fa47f659835dee8290a047c3b655ce7cef3d06635120e5925a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "321ee9258bfa543b576c8a9254f1172d595aabf70b3bb1460a64facec073743c"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "08af0d6e903f2087372ba3ee709358d2c992982ad5cd1ff5dfecc424c5ee231f"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "393ccfa3b6af765572073ef6e1d017c58679a7ef5168cb683d752e312b406856"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    assert_match "Client Version: v#{version}", shell_output("#{bin}/crossplane version --client")
  end
end
