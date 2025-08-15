class Crossplane < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "2.0.2"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "4d64914fd0dfe893ad47b9064164bcd4ffc2d8e047e38515a79d1139bc8e762a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "f1e8f68f6cb172cb67eaeec7d757aa40658533cb84f62752c9af67657fa3a449"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "33996b48004db9238c29b677d8166e92bfc9abef632e463ffefce5432b742d5e"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "37a6c10d80f5f5ea4318ac81a6f7f71c2ea0ad5d03c71db14f1e444308ab552f"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "4e5577c0dce69ee349e782151364d6608a2bae2b4ce5da127964ea7329f714ea"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
