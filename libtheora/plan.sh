pkg_name=libtheora
pkg_origin=fifthecho
pkg_version="1.1.1"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("BSD-3-Clause")
pkg_source="http://downloads.xiph.org/releases/theora/${pkg_name}-${pkg_version}.tar.bz2"
pkg_shasum="b6ae1ee2fa3d42ac489287d3ec34c5885730b1296f0801ae577a35193d3affbc"
pkg_deps=(
  core/glibc
  fifthecho/libogg
  fifthecho/libvorbis
)
pkg_build_deps=(
  core/make
  core/gcc
  core/pkg-config
  core/diffutils
  core/coreutils
  core/file
)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_bin_dirs=(bin)
pkg_pconfig_dirs=(lib/pkgconfig)
pkg_description="Theora video compression"
pkg_upstream_url="https://www.theora.org/"

# do_build() {
#   attach
#   do_default_build
# }
