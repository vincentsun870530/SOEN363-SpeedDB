# Will put conditions later
# Create a new DB
psql -f sql_scripts/createdb.sql

# Create tables
psql -d speeddb -f sql_scripts/create_table.sql