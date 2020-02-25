#!bin/bash
# Will put conditions later
# Create a new DB
psql -f sql_scripts/create_db.sql

# Drop exsiting tables
psql -d speeddb -f sql_scripts/drop_tables.sql

# Create tables
psql -d speeddb -f sql_scripts/create_tables.sql

# Copy data from .dat to tables
psql -d speeddb -f sql_scripts/copy_data_to_db.sql