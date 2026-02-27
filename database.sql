-- ===============================
-- Create limited user (if not exists)
-- ===============================

DO
$$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles WHERE rolname = 'hassan'
   ) THEN
      CREATE ROLE hassan LOGIN PASSWORD 'hassan';
   END IF;
END
$$;


-- ===============================
-- Grant database access
-- ===============================

GRANT CONNECT ON DATABASE crud_app TO hassan;
GRANT USAGE ON SCHEMA public TO hassan;


-- ===============================
-- Create tables
-- ===============================

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS notes (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ===============================
-- Grant table permissions
-- ===============================

GRANT SELECT, INSERT, UPDATE, DELETE 
ON ALL TABLES IN SCHEMA public 
TO hassan;

-- Ensure future tables also get permissions
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO hassan;


-- ===============================
-- Grant sequence permissions (VERY IMPORTANT)
-- ===============================

GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO hassan;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO hassan;
