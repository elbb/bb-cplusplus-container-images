toolchain=/
target_host=x86_64-linux-gnu
cc_compiler=gcc-9
cxx_compiler=g++-9

[settings]
os=Linux
arch=x86_64
compiler=gcc
compiler.version=9.3
compiler.libcxx=libstdc++11
compiler.cppstd=17
build_type=Release
[options]
[build_requires]
ninja/1.10.*: cmake/[>=3.15.0]
[env]
CONAN_CMAKE_FIND_ROOT_PATH=$toolchain
CHOST=$target_host
AR=$target_host-ar
AS=$target_host-as
RANLIB=$target_host-ranlib
CC=$target_host-$cc_compiler
CXX=$target_host-$cxx_compiler
STRIP=$target_host-strip
RC=$target_host-windres
