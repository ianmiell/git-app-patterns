#!/bin/bash

# Exit on error.
set -e

# Only run outside the container
if [ -e /.dockerenv ]
then
	echo 'Must be run in container only'
	exit 1
fi

# Make sure the code is up to date with the origin, preferring any local
# changes we have made. Rebase to preserve a simpler history.
git pull --rebase -s recursive -X ours origin gitdb-sqlite-docker

DBNAME='dates.db'
DBEXPORTFILE='db_export.sql'

rm -f ${DBNAME}

# Import db from git
cat ${DBEXPORTFILE} | sqlite3 ${DBNAME}

# Access the db.
sqlite3 ${DBNAME}

# Remove the db.
rm -f ${DBNAME}
