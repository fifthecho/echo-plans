pkg_name=libogg
pkg_origin=fifthecho
pkg_version="1.3.3"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("BSD-3-Clause")
pkg_source="http://downloads.xiph.org/releases/ogg/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="c2e8a485110b97550f453226ec644ebac6cb29d1caef2902c007edab4308d985"
pkg_deps=(
  core/glibc
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
pkg_description="The Ogg container format"
pkg_upstream_url="https://www.xiph.org/ogg/"

# do_build() {
#   attach
#   do_default_build
# }
