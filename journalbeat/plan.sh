pkg_name=journalbeat
pkg_origin=fifthecho
pkg_version="7.12.0"
pkg_maintainer="Jeff Moody <fifthecho@gmail.com>"
pkg_license=("Apache-2.0")
pkg_architecture="x86_64"
pkg_source="https://github.com/elastic/beats.git"
pkg_deps=(
  core/glibc
  core/systemd
)
pkg_build_deps=(
  core/go
  core/gcc
  core/python
  core/mage
  core/pkg-config
  core/git
  core/docker
)
pkg_bin_dirs=(bin)
pkg_svc_user=root
pkg_svc_group=${pkg_svc_user}
pkg_optional_binds=(
  [elasticsearch]="port"
)

do_download() {
  REPO_PATH="${HAB_CACHE_SRC_PATH}/${pkg_dirname}"
  rm -Rf "$REPO_PATH"
  git clone --recurse-submodules -j"$(nproc)" "${pkg_source}" "${REPO_PATH}"
  pushd "${REPO_PATH}" || exit 1
  git checkout v${pkg_version}
}

do_clean() {
  return 0
}

do_unpack() {
  return 0
}

do_verify() {
  return 0
}

do_build() {
  export C_INCLUDE_PATH=$(pkg_path_for core/systemd)/include:$C_INCLUDE_PATH
  pushd $pkg_name
  make
  popd
}

do_install() {
  cp $pkg_name/$pkg_name $pkg_prefix/bin
}
