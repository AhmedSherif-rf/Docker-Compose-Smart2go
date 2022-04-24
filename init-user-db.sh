#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "postgres" <<-EOSQL
	CREATE USER smart2go;
	CREATE DATABASE smart2go;
	CREATE USER sadmin;
	CREATE DATABASE sadmin;
	ALTER DATABASE smart2go OWNER TO smart2go;
	ALTER DATABASE sadmin OWNER TO sadmin;
EOSQL
