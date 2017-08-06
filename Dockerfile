FROM ubuntu:xenial
RUN apt-get update -y
RUN apt-get install -y sqlite3 git
RUN mkdir /gitdb-sqlite-docker-makefile
WORKDIR /gitdb-sqlite-docker-makefile
ADD . /gitdb-sqlite-docker-makefile
RUN git config --global user.email "ian.miell@gmail.com"
RUN git config --global user.name "Ian Miell"
ARG GITHUB_PASSWORD
RUN git remote set-url origin https://ianmiell:${GITHUB_PASSWORD}@github.com/ianmiell/git-app-patterns
CMD /gitdb-sqlite-docker-makefile/app_script.sh
