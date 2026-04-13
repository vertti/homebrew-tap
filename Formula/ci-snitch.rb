class CiSnitch < Formula
  desc "CI performance analyzer — detects regressions, outliers, and trends in GitHub Actions"
  homepage "https://github.com/vertti/ci-snitch"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vertti/ci-snitch/releases/download/v0.6.0/ci-snitch_0.6.0_darwin_arm64.tar.gz"
      sha256 "b7cec4257748f1303fdeecbf700f924f37179406072bb007b4dabbbd733d5a7c"
    else
      url "https://github.com/vertti/ci-snitch/releases/download/v0.6.0/ci-snitch_0.6.0_darwin_amd64.tar.gz"
      sha256 "f1c8e3f8902cd88cd63399106bb33ebd32ce8718484b75990c382e20c916b1b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vertti/ci-snitch/releases/download/v0.6.0/ci-snitch_0.6.0_linux_arm64.tar.gz"
      sha256 "0bf8ce443e277a06fee06a114d75cb19630a1552bb73c13227760a48f8de73cd"
    else
      url "https://github.com/vertti/ci-snitch/releases/download/v0.6.0/ci-snitch_0.6.0_linux_amd64.tar.gz"
      sha256 "987b02b5719ab4c697f5e6454eed0cb700f92179ae43c7c9f8490f468f0e211f"
    end
  end

  def install
    bin.install "ci-snitch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ci-snitch version")
  end
end
