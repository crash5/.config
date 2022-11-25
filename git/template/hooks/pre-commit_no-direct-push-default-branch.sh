BRANCH=$(git rev-parse --abbrev-ref HEAD)
DEFAULT_BRANCH=$(basename $(git rev-parse --abbrev-ref origin/HEAD))

if [ "$BRANCH" == "$DEFAULT_BRANCH" ]; then
    read -p "Commit directly to the default branch: ${DEFAULT_BRANCH}? (y/N) " yn < /dev/tty
    case $yn in
        [yY] ) exit 0;;
        * ) exit 1;;
    esac
fi
