class Kf5Kjs < Formula
  desc "Support for JS scripting in applications"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.55/portingAids/kjs-5.55.0.tar.xz"
  sha256 "0c9c9bf3e91a416f2dc5f651ed77efe9e9c445e0574af60fdf121cfb74f73c30"

  head "git://anongit.kde.org/kjs.git"

  depends_on "cmake" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build
  depends_on "KDE-mac/kde/kf5-kdoctools" => :build

  depends_on "pcre"
  depends_on "qt"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end

  def caveats; <<~EOS
    You need to take some manual steps in order to make this formula work:
      ln -sfv "$(brew --prefix)/share/kf5" "$HOME/Library/Application Support"
  EOS
  end
end
