#!/bin/bash

#echo -n "$@" | hexdump -v -e '/1 "%02X"'
echo -n "$@" | xxd -p -c 256
