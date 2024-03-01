#!/bin/sh
# Tester script for assignment 1 and assignment 2
# Modified to use the writer C application

set -e
set -u

NUMFILES=10
WRITESTR=AELD_IS_FUN
WRITEDIR=/tmp/aeld-data
username=$(cat conf/username.txt)

if [ $# -lt 3 ]; then
    echo "Using default value ${WRITESTR} for string to write"
    if [ $# -lt 1 ]; then
        echo "Using default value ${NUMFILES} for number of files to write"
    else
        NUMFILES=$1
    fi    
else
    NUMFILES=$1
    WRITESTR=$2
    WRITEDIR=/tmp/aeld-data/$3
fi

MATCHSTR="The number of files are ${NUMFILES} and the number of matching lines are ${NUMFILES}"

echo "Writing ${NUMFILES} files containing string ${WRITESTR} to ${WRITEDIR}"

rm -rf "${WRITEDIR}"

# create $WRITEDIR if not assignment1
assignment=$(cat conf/assignment.txt)

if [ "$assignment" != 'assignment1' ]; then
    mkdir -p "$WRITEDIR"
    if [ ! -d "$WRITEDIR" ]; then
        echo "Failed to create $WRITEDIR"
        exit 1
    fi
fi

# Removed the make steps
# echo "Removing the old writer utility and compiling as a native application"
# make clean
# make

for i in $(seq 1 $NUMFILES); do
    ./writer "$WRITEDIR/${username}$i.txt" "$WRITESTR"
done

OUTPUTSTRING=$(./finder.sh "$WRITEDIR" "$WRITESTR")

# remove temporary directories
rm -rf /tmp/aeld-data

echo "OutputString: ${OUTPUTSTRING}"
echo "Expected Match String: ${MATCHSTR}"

set +e
echo "${OUTPUTSTRING}" | grep "${MATCHSTR}"
if [ $? -eq 0 ]; then
    echo "Success"
    exit 0
else
    echo "Test failed"
    exit 1
fi
