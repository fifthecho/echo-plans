pkg_name=sensu-go-cli
pkg_origin=kepler
pkg_version="6.2.6"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("MIT")
pkg_source="https://github.com/sensu/sensu-go/archive/v${pkg_version}.tar.gz"
pkg_shasum="1714d92dc1a6a639ad6c3aa9372cb09d2a8eb772e3983eae8416111b53a94197"
pkg_deps=(
  core/glibc
)
pkg_build_deps=(
  core/gcc
  core/go
  core/git
)
pkg_bin_dirs=(bin)

do_unpack() {
  do_default_unpack
  if [ ! -d /hab/cache/src/${pkg_dirname} ]; then
    mv /hab/cache/src/sensu-go-${pkg_version} /hab/cache/src/${pkg_dirname}
  fi
}

do_build() {
  local buildday=$(date +%F)
  go build -ldflags '-X "github.com/sensu/sensu-go/version.Version='`echo ${pkg_version}`'" -X "github.com/sensu/sensu-go/version.BuildDate='`echo ${buildday}`'" -extldflags "-static -v"' -o bin/sensuctl ./cmd/sensuctl
}

do_install() {
  cp bin/sensuctl ${pkg_prefix}/bin/${pkg_name}
  pushd ${pkg_prefix}/bin || exit 1
  ln -s ${pkg_name} sensuctl
  popd || exit 1
}