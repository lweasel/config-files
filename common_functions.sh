#!/bin/bash

# From http://martinghunt.github.io/2016/01/25/less-foo.bam.html
original_less=$(which less)

less() {
    regex="[[:graph:]]+\.bam($|[[:space:]])"

    if [[ $@ =~ ${regex} ]]; then
        sambamba view $@ | ${original_less}
    else
        eval ${original_less} $@
    fi
}

