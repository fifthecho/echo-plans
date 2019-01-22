pkg_name=libvorbis
pkg_origin=fifthecho
pkg_version="1.3.6"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("BSD-3-Clause")
pkg_source="http://downloads.xiph.org/releases/vorbis/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="6ed40e0241089a42c48604dc00e362beee00036af2d8b3f46338031c9e0351cb"
pkg_deps=(
  core/glibc
  fifthecho/libogg
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
pkg_description="Vorbis audio compression"
pkg_upstream_url="https://xiph.org/vorbis/"

# do_build() {
#   attach
#   do_default_build
# }
