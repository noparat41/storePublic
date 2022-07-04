!host_build|!cross_compile {
    QMAKE_CXXFLAGS+=-DQT_FB_DRM_ARGB32
}
host_build {
    QT_CPU_FEATURES.x86_64 = mmx sse sse2
} else {
    QT_CPU_FEATURES.arm = 
}
QT.global_private.enabled_features = alloca_h alloca dbus dbus-linked dlopen gui libudev network posix_fallocate reduce_exports release_tools relocatable sql system-zlib testlib widgets xml
QT.global_private.disabled_features = sse2 alloca_malloc_h android-style-assets avx2 private_tests gc_binaries reduce_relocations stack-protector-strong zstd
PKG_CONFIG_EXECUTABLE = /home/nopparat/host/bin/pkg-config
QMAKE_LIBS_DBUS = -L/home/nopparat/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -ldbus-1
QMAKE_INCDIR_DBUS = /home/nopparat/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0 /home/nopparat/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
QMAKE_LIBS_LIBDL = 
QMAKE_LIBS_LIBUDEV = -L/home/nopparat/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -ludev
QT_COORD_TYPE = double
QMAKE_LIBS_ZLIB = -lz
CONFIG -= precompile_header
CONFIG += cross_compile compile_examples enable_new_dtags largefile
QT_BUILD_PARTS += libs
QT_HOST_CFLAGS_DBUS += -I/home/nopparat/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0 -I/home/nopparat/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
