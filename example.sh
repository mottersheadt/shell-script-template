#!/usr/bin/env bash

(
################################################
# SETTINGS                                     #
################################################
# If you do not set these variables, you will be
# prompted during script execution.

EXAMPLE_VAR=""
################################################

# Enforce that this script is being run with bash.
if [ -z $BASH_VERSION ]; then
    echo "BASH_VERSION not set. Please run this script using Bash"
    return
fi

# Error handling
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap '[ $? = "0" ] || echo "ERROR: \"${last_command}\" command failed with exit code $?."' EXIT

# Handy function for reading variable value, or prompting the user to enter it
# Usage:
# EXAMPLE_VAR=$(get_param "What is the value of your example variable?" $EXAMPLE_VAR)
get_param () {
    local MESSAGE=$1
    local PARAM=$2
    if [ -z $PARAM ]; then
       read -p "$MESSAGE " PARAM
    fi;
    echo $PARAM;
}

cat <<-EOF

Describe what is happening in this script here:

1. Does something
2. And something else
3. etc...

Do you want to continue? [y/N]
EOF
read CONT 
CONT=${CONT:-N}

if [ $CONT != "y" ]; then
    echo "Exiting."
    return
fi

EXAMPLE_VAR=$(get_param "What is the value of your example variable? [p/s]" $EXAMPLE_VAR)

if [ $EXAMPLE_VAR = "p" ]; then
    echo "you entered 'p'"
elif [ $EXAMPLE_VAR = "s" ]; then
    echo "you entered 's'"
else
    echo "Invalid entry. Exiting."
    return
fi

echo ">>> 1. Do something"


echo ">>> 2. Do someting else.."

echo ">>> 3. etc..."

echo "Success!"
)
