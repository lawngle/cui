#! /bin/bash
# Purpose: Report nonzero vib. frequencies and their IR intensities

# help
help() {
	echo "Usage: vibir [OPTION]..."
	echo
	echo " -h, --help	Display this help message"
	echo " -v, --verbose	Enable debug output"
	echo " -o, --output	Specify output file (doesn't work yet)"
	echo
}

# Varibales

# Parse options
while :; do
	case $1 in
		-h | --help)
			help
			exit ;;
		-v | --verbose)
			set -xv ;;
		--)
			shift
			break ;;
		-?*)
			echo 'Unknown option (ignoring): ' "$1" >&2;;
		*)
			break ;;
	esac
	shift
done


awk '
BEGIN {print "Vibrational Frequency  IR Intensity"}
{
	
}
END {}' force.out
# END {print; nr[NR+6]; next}; NR in nr' force.out
