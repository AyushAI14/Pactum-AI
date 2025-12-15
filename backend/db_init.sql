-- Code of database creation ***********************************************
-- CREATE DATABASE contract_ai;
-- CREATE USER contract_user WITH PASSWORD 'contract_pass';
-- ALTER ROLE contract_user SET client_encoding TO 'utf8';
-- ALTER ROLE contract_user SET default_transaction_isolation TO 'read committed';
-- ALTER ROLE contract_user SET timezone TO 'UTC';
-- GRANT ALL PRIVILEGES ON DATABASE contract_ai TO contract_user;

-- the database url is in .env file



-- Table creation code ======================================================
-- i used the pg admin to add table for same code as its easy 

CREATE TABLE IF NOT EXISTS contracts (
    id SERIAL PRIMARY KEY,
    filename TEXT NOT NULL,
    status TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS clauses (
    id SERIAL PRIMARY KEY,
    contract_id INT REFERENCES contracts(id),
    clause_text TEXT
);

CREATE TABLE IF NOT EXISTS risks (
    id SERIAL PRIMARY KEY,
    contract_id INT REFERENCES contracts(id),
    risk_type TEXT,
    severity TEXT
);

CREATE TABLE IF NOT EXISTS workflows (
    id SERIAL PRIMARY KEY,
    contract_id INT REFERENCES contracts(id),
    state TEXT
);