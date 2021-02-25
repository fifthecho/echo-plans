pkg_name=sensu-go-agent
pkg_origin=kepler
pkg_version="6.2.3"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("MIT")
pkg_source="https://github.com/sensu/sensu-go/archive/v${pkg_version}.tar.gz"
pkg_shasum="13207680bf6ed7b105e76cb94cf3cc886e3e34f73748a7d96cf566817dd9814a"
pkg_deps=(
  core/glibc
)
pkg_build_deps=(
  core/gcc
  core/go
  core/git
  core/make
)
pkg_bin_dirs=(bin)
pkg_svc_user="root"
pkg_svc_group=${pkg_svc_user}
pkg_binds=(
  [backend]="agent-port"
)

do_unpack() {
  do_default_unpack
  if [ ! -d /hab/cache/src/${pkg_dirname} ]; then
    mv /hab/cache/src/sensu-go-${pkg_version} /hab/cache/src/${pkg_dirname}
  fi
}

do_build() {
  local buildday=$(date +%F)
  go build -ldflags '-X "github.com/sensu/sensu-go/version.Version='`echo ${pkg_version}`'" -X "github.com/sensu/sensu-go/version.BuildDate='`echo ${buildday}`'" -extldflags "-static -v"' -o bin/sensu-agent ./cmd/sensu-agent
}

do_install() {
  cp bin/sensu-agent ${pkg_prefix}/bin/${pkg_name}
  pushd ${pkg_prefix}/bin || exit 1
  ln -s ${pkg_name} sensu-agent
  popd || exit 1
}