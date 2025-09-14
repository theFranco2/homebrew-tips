class Tips < Formula
  desc "Tips gives you fast explanations for commands. Simply."
  homepage "https://github.com/theFranco2/homebrew-tips"
  url "https://github.com/theFranco2/homebrew-tips/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f083ae950ebf7389c45f2ee21beef2618162861f09dcca738599f40b2afa2846"
  license "BSD-2-Clause"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/tips")
  end
end
