-- EXAMPLE: Initialize MariaDB for Slurm Accounting
-- Replace placeholders before production

-- 1) Create DB
CREATE DATABASE <SLURM_ACCOUNTING_DB>;

-- 2) Create user
CREATE USER '<DB_USER>'@'<DB_CLIENT_HOST>' IDENTIFIED BY '<DB_PASSWORD>';

-- 3) Grant privileges
GRANT ALL PRIVILEGES ON <SLURM_ACCOUNTING_DB>.* TO '<DB_USER>'@'<DB_CLIENT_HOST>';

-- 4) Apply
FLUSH PRIVILEGES;

-- Optional verify
-- SHOW DATABASES;
-- SELECT User, Host FROM mysql.user;