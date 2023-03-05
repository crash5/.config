BRANCH=$(git rev-parse --abbrev-ref HEAD)
DEFAULT_BRANCH='main|master'

# If output not a tty exit
if [ ! -t 1 ]; then exit 0; fi

if [[ "$BRANCH" =~ ^($DEFAULT_BRANCH)$ ]]; then
    read -p "Commit directly to the default branch: ${BRANCH}? (y/N) " yn < /dev/tty
    case $yn in
        [yY] ) exit 0;;
        * ) exit 1;;
    esac
fi
