pkg_name=perl-xmlparser
pkg_distname=XML-Parser
pkg_origin=fifthecho
pkg_version="2.44_01"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Artistic-1.0-Perl")
pkg_source="https://github.com/toddr/${pkg_distname}/archive/v${pkg_version}.tar.gz"
# pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="ab8d31ba983906f662f2eacf4773b9e44cc3dc5e60d95b81edebbc88f413035a"
pkg_deps=(
  core/glibc
  core/perl
  core/expat
  core/local-lib
)
pkg_build_deps=(
  core/make
  core/gcc
  core/coreutils
  core/local-lib
  core/expat
  core/cpanminus
)
pkg_lib_dirs=(lib)
pkg_bin_dirs=(bin)
pkg_description="A perl module for parsing XML documents"
pkg_upstream_url="https://github.com/toddr/XML-Parser"

do_unpack() {
  do_default_unpack
  pushd ${HAB_CACHE_SRC_PATH} || exit 1
  if [ -d ${pkg_name}-${pkg_version} ]; then
    rm -Rf ${pkg_name}-${pkg_version}
  fi
  mv ${pkg_distname}-${pkg_version} ${pkg_name}-${pkg_version}
  popd || exit 1
}

do_build() {
  # Load local::lib into our current perl include chain
  eval "$(perl -I$(pkg_path_for core/local-lib)/lib/perl5 -Mlocal::lib=$(pkg_path_for core/local-lib))"
  # Create a new lib dir in our pacakge for cpanm to house all of its libs
  eval $(perl -Mlocal::lib=${pkg_prefix})
  perl Makefile.PL EXPATLIBPATH=$(pkg_path_for core/expat)/lib EXPATINCPATH=$(pkg_path_for core/expat)/include
  make
}

do_install() {
  make install
}
