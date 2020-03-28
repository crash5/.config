go() {
    docker run --rm -v "$(pwd)":/go golang:alpine go "$@"
}
