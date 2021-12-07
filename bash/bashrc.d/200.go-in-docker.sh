go() {
    docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp golang:alpine go "$@"
}
