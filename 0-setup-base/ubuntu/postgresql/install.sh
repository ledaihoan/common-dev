#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo apt-get install -y postgresql-common
yes | sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
sudo apt-get install -y postgresql
sudo systemctl enable postgresql && sudo systemctl start postgresql
# initialize db
"$CURRENT_DIR"/setup_db_remote.sh
"$CURRENT_DIR"/setup_db_admin.sh
