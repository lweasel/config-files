#!/bin/bash

#
# A 'less' that can deal with BAM files.
# From http://martinghunt.github.io/2016/01/25/less-foo.bam.html
#

original_less=$(which less)

function less() {
    regex="[[:graph:]]+\.bam($|[[:space:]])"

    if [[ $@ =~ ${regex} ]]; then
        sambamba view $@ | ${original_less}
    else
        eval ${original_less} $@
    fi
}

#
# A 'head' which can deal with gzipped files.
# Adapted from https://gist.github.com/brwnj/5536490
#

function zhead () {
    num_args=$#
    arg_array=("${@}")
    head_args=("${arg_array[@]:0:${num_args}-1}")
    file=${arg_array[${num_args}]}

    zcat ${file} | head ${head_args[*]}
}
