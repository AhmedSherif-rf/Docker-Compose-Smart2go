CREATE USER smart2go;
CREATE DATABASE smart2go;
CREATE DATABASE sadmin;
CREATE USER sadmin;
GRANT ALL PRIVILEGES ON DATABASE smart2go TO smart2go;
GRANT ALL PRIVILEGES ON DATABASE sadmin TO sadmin;
ALTER DATABASE smart2go OWNER TO smart2go;
ALTER DATABASE sadmin OWNER TO sadmin;
ALTER USER sadmin WITH PASSWORD 'sadmin';
ALTER USER smart2go WITH PASSWORD 'smart2go';
