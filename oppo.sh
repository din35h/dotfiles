#!/bin/sh

CHAR=${1:-◼◼}

echo
for i in {0..7}; do echo -en " \e[0;3${i}m${CHAR}\e[0m"; done; echo
for i in {0..7}; do echo -en " \e[1;3${i}m${CHAR}\e[0m"; done; echo
echo