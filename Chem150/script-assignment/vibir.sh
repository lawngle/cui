#! /bin/bash
# Purpose: Report nonzero vib. frequencies and their IR intensities

# help
help() {
	echo "Usage: vibir [OPTION]..."
	echo
	echo " -h, --help		Display this help message"
	echo " -v, --verbose		Enable debug output"
	echo " -o, --output 	FILE	Specify output file"
	echo
}

# Varibales
OUTPUT="/dev/stdout"

# Parse options
while :; do
	case $1 in
		-h | --help)
			help
			exit ;;
		-v | --verbose)
			set -xv ;;
		-o | --output)
			OUTPUT="$2"
			if [[ -z "$2" ]]; then
				echo "No output file specified :3" >&2
				exit 1
			fi;;
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

# Check arguments
# Execute
awk '
/frequency\ \ /
' force.out > $OUTPUT

# END {print; nr[NR+6]; next}; NR in nr' force.out
