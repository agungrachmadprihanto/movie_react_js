#!/bin/bash

# Echo the purpose of the script
echo 'The following command terminates the "npm start" process using its PID'
echo '(written to ".pidfile"), all of which were conducted when "deliver.sh"'
echo 'was executed.'

# Enable debugging
set -x

# Check if the .pidfile exists
if [ ! -f .pidfile ]; then
  echo ".pidfile not found!"
  exit 1
fi

# Read the PID from the .pidfile
PID=$(cat .pidfile)

# Check if the process with the PID exists
if ps -p $PID > /dev/null; then
  # Terminate the process
  kill $PID
  echo "Process $PID terminated."
else
  echo "Process $PID does not exist."
fi

# Optionally, remove the .pidfile after killing the process
rm .pidfile
