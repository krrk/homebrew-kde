class Kf5Kdewebkit < Formula
  desc "KDE Integration for QtWebKit"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.46/kdewebkit-5.46.0.tar.xz"
  sha256 "f4dec6010f3590596460c203455c974e1a58276a58c1cf7367de932177d5246f"

  head "git://anongit.kde.org/kdewebkit.git"

  depends_on "cmake" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "KDE-mac/kde/kf5-kparts"
  depends_on "KDE-mac/kde/qt-webkit"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"
    args << "-DQt5WebKitWidgets_DIR=#{HOMEBREW_PREFIX}/lib/cmake/Qt5WebKitWidgets"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
