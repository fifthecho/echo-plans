pkg_name=sensu-go-web
pkg_origin=fifthecho
pkg_version="1.0.6"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("MIT")
# pkg_scaffolding="some/scaffolding"
pkg_source="https://github.com/sensu/web.git"
pkg_deps=(
  core/glibc
  core/node
  core/yarn
  core/git
)
pkg_build_deps=(
  core/make
  core/gcc
  core/git
)
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)
pkg_binds=(
  [backend]="api-port"
)
pkg_svc_user="hab"
pkg_svc_group="$pkg_svc_user"

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
  yarn install
}

do_install() {
  mkdir ${pkg_prefix}/src
  mkdir ${pkg_prefix}/lib
  cp -R ${HAB_CACHE_SRC_PATH}/${pkg_dirname}/* ${pkg_prefix}/src
  cp -R ${HAB_CACHE_SRC_PATH}/${pkg_dirname}/.git ${pkg_prefix}/src
  cp -R ${HAB_CACHE_SRC_PATH}/${pkg_dirname}/.schema ${pkg_prefix}/src
  cp -R ${HAB_CACHE_SRC_PATH}/${pkg_dirname}/.yarn* ${pkg_prefix}/src
  rm ${pkg_prefix}/src/*md
  yarn install --modules-folder ${pkg_prefix}/lib
}

do_strip() {
  rm -R ${pkg_prefix}/lib/flow-bin/flow-win*
  rm -R ${pkg_prefix}/lib/flow-bin/flow-osx*
}
