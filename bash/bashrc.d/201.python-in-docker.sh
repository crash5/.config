dpython() {
    docker run -ti --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp python python "$@"
}
