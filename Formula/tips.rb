class Tips < Formula
  desc "Tips gives you fast explanations for commands. Simply."
  homepage "https://github.com/theFranco2/homebrew-tips"
  url "https://github.com/theFranco2/homebrew-tips/archive/refs/tags/v1.0.1.tar.gzc"
  sha256 "bd9ac84a7947b865a40f80a75279bdd1198982672dd79de1938e090db461aebb"
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
