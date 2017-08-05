#!/bin/bash

# Exit on error.
set -e

# Make sure the code is up to date with the origin, preferring any local
# changes we have made. Rebase to preserve a simpler history.
git pull --rebase -s recursive -X ours origin gitdb

# The trivial 'application' here simply writes the date to a file.
date > date.txt

# Commit the change made.
git commit -am 'Update from app_script.sh'

# Push the changes to the origin.
git push -u origin gitdb
