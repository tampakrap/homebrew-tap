class Crossplane < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "2.2.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "f1c8986cd9a90ccd9f9784567cfc8905e6c843c6ed845097a14471db1ef3d6c7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "1ef028af4ad9ab59d810e63acdb67d0778d251db0e8a0615ad924145fd2bcb9a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "482b6aafcf9d41e7eeaa14ace12f16ddf0d98059ad58929622bb8eeb7d35a3a1"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "6e710da0349e029250d1a7d92d7596a68dce02d50d080c96bb922e63bfa41b14"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "747e0312deeacb14d62f0888fca669e4bb4aed156d0cebc970c384e65a6f64e3"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    assert_match "Client Version: v#{version}", shell_output("#{bin}/crossplane version --client")
  end
end
