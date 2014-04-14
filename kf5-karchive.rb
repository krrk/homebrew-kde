require "formula"

class Kf5Karchive < Formula
  url "http://download.kde.org/unstable/frameworks/4.98.0/karchive-4.98.0.tar.xz"
  sha1 "8c3ea4d54b6a6bd3493f8d056e697edef1af0cd4"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/karchive.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
