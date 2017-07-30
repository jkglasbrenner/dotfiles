#!/bin/bash
printf -v ARGS "%q " "$@"
exec ssh notmuch mbsync ${ARGS}

