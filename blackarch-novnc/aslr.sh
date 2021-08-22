#!/bin/sh

file='/proc/sys/kernel/randomize_va_space'

case "$1" in
	on|1) echo 0 | sudo tee $file;;
	off|2) echo 2 | sudo tee $file;;
	*) echo "$0 [on|off]";;
esac
