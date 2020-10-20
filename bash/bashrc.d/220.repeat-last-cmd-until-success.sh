repeatuntilsuccess()
{
    if [[ $# == 0 ]]; then
        # CMD=$(fc -ln | tail -2 | head -1)
        CMD=$(fc -ln -1)
    else
        CMD="$@"
    fi

    echo "repeating until success: $CMD"
    until $CMD
    do
        sleep 1
    done
}
