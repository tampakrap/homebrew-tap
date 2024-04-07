class Crossplane < Formula
  desc 'The official Crossplane CLI'
  homepage 'https://crossplane.io'
  version 'v1.15.1'
  license '???'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.15.1/bin/darwin_amd64/crank'
    sha256 '859d9639cedd0fa58ee397c85e04fa35a4975d952b8cdca076a374806da366b4'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.crossplane.io/stable/v1.15.1/bin/darwin_arm64/crank'
    sha256 'b7acdf9d934917369dd0790531735725bfc56e2ecf7b1b25565dd3660720223a'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.crossplane.io/stable/v1.15.1/bin/linux_amd64/crank'
    sha256 'd07b2151dba16f91ebb3e4025116690cf2452d80e8118afcb89937e4b3387133'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.15.1/bin/linux_arm/crank'
    sha256 '28c433c076d371c2480f665d13b60c727531f439e56eb46bcb5a2d31f112a686'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.crossplane.io/stable/v1.15.1/bin/linux_arm64/crank'
    sha256 'f836ed6f8f89224ca4767512ab284378f3c862890ac5f420d66b01fada5bfeb5'
  end

  def install
    bin.install 'crossplane'
  end

  test do
    system "#{bin}/crossplane -v"
  end
end
