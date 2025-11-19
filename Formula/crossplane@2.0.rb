class CrossplaneAT20 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "2.0.4"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "8e82c97ef94a6576d3705d01f1e51ce6ecb184b15f248085c4693a76b323bdc2"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "a33a4365bb755a49e9b2c77601bc7090d274787537ebed672dd77ac5be8f4067"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "f640fc507a4e04f7fa4af71ca1cdb367b6f88286326bae3fdbf32144d575363c"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "fc5074e91df7e5ed59e630f2db84b87918495edd472f9642b0735d088ed6256b"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "c7ea0027945d727cdb392a62a05ead38fa8273a87d1ca67a69d88e54d253f42a"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
