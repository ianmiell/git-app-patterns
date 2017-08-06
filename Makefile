help:
	@echo 'make run    - run the alertonchange checker'
	@echo 'make access - access the alertonchange environment, eg to insert data'

access: check_host check_nodiff restore
	# Access the db.
	sqlite3 dates.db
	# Remove the db.
	rm -f dates.db

run: check_host check_nodiff
	# run the script
	./run.sh
	@$(MAKE) -f Makefile check_nodiff

restore: check_nodiff
	rm -f dates.db
	cat db_export.sql | sqlite3 dates.db

check_host:
	# only run in a host
	if [ -e /.dockerenv ]; then exit 1; fi

check_container:
	# only run in a container
	if [ ! -e /.dockerenv ]; then exit 1; fi

check_nodiff:
	# Pull to check we do not have local changes
	git pull --rebase -s recursive -X ours origin gitdb-sqlite-docker-makefile
