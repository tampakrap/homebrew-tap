class Crossplane < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.20.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "8c8874efef15b3eea2607c5e855be754a5227ca183e35d87bc70560b480f12ab"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "d7df3c4b5b93221efef0aeb1ab5777ed2192cf7a33eb6ae219bbd679982959dd"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "4eb4947b2b9db9c7c42d20f5e4f118d3a1fa36d5efaa6fb7b2673b594c77266e"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "e949c82ffeef8cf7f218947dcedd9a524517f8c7f0a7fedbc233751cc6373868"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "5ded2271fee97bf498ddd0863df70b8a742742f29ff50f9da4b7531306542a25"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
