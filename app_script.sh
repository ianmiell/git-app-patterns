#!/bin/bash

# Exit on error.
set -e

# Make sure the code is up to date with the origin, preferring any local
# changes we have made. Rebase to preserve a simpler history.
git pull --rebase -s recursive -X ours origin gitdb-sqlite

DBNAME='dates.db'
DBEXPORTFILE='db_export.sql'

rm -f ${DBNAME}

# Import db from git
cat ${DBEXPORTFILE} | sqlite3 ${DBNAME}

# The trivial 'application' here simply writes the date to a file.
DATE="$(date '+%Y-%m-%d %H:%M:%S')"
echo $DATE
echo "insert into dates(date) values(\"${DATE}\");" | sqlite3 ${DBNAME}

# Export db from sqlite
echo ".dump" | sqlite3 ${DBNAME} > ${DBEXPORTFILE}


# Commit the change made.
git commit -am 'Update from app_script.sh'

# Push the changes to the origin.
git push -u origin gitdb-sqlite
