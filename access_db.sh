#!/bin/bash

# Exit on error.
set -e

DBNAME='dates.db'
DBEXPORTFILE='db_export.sql'

rm -f ${DBNAME}

# Import db from git
cat ${DBEXPORTFILE} | sqlite3 ${DBNAME}

# Access the db.
sqlite3 ${DBNAME}

# Remove the db.
rm -f ${DBNAME}
