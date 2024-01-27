
-- Create audit table for tracking DDL changes in the database schema
CREATE TABLE schema_audit (
    change_id SERIAL PRIMARY KEY,
    change_type VARCHAR(50),
    object_name VARCHAR(255),
    schema_name VARCHAR(50),
    change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    additional_info TEXT
);

-- Event trigger for CREATE statements
CREATE OR REPLACE FUNCTION log_ddl_create_event()
RETURNS event_trigger AS $$
BEGIN
    INSERT INTO schema_audit (change_type, object_name, schema_name, additional_info)
    SELECT 'CREATE', obj.object_identity, obj.schema_name, current_query()
    FROM pg_event_trigger_ddl_commands() AS obj
    WHERE obj.command_tag = 'CREATE TABLE';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER trigger_on_create
ON ddl_command_end
WHEN TAG IN ('CREATE TABLE')
EXECUTE FUNCTION log_ddl_create_event();

-- Event trigger for ALTER statements
CREATE OR REPLACE FUNCTION log_ddl_alter_event()
RETURNS event_trigger AS $$
BEGIN
    INSERT INTO schema_audit (change_type, object_name, schema_name, additional_info)
    SELECT 'ALTER', obj.object_identity, obj.schema_name, current_query()
    FROM pg_event_trigger_ddl_commands() AS obj
    WHERE obj.command_tag = 'ALTER TABLE';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER trigger_on_alter
ON ddl_command_end
WHEN TAG IN ('ALTER TABLE')
EXECUTE FUNCTION log_ddl_alter_event();

-- Event trigger for DROP statements
CREATE OR REPLACE FUNCTION log_ddl_drop_event()
RETURNS event_trigger AS $$
BEGIN
    INSERT INTO schema_audit (change_type, object_name, schema_name, additional_info)
    SELECT 'DROP', obj.object_identity, obj.schema_name, current_query()
    FROM pg_event_trigger_ddl_commands() AS obj
    WHERE obj.command_tag = 'DROP TABLE';
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER trigger_on_drop
ON ddl_command_end
WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION log_ddl_drop_event();

-- Query audit table
SELECT * FROM schema_audit ORDER BY change_timestamp DESC;

-- Sample statements to test event triggers

-- Testing CREATE
CREATE TABLE test_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Testing ALTER
ALTER TABLE test_table ADD COLUMN email VARCHAR(255);
-- Testing ALTER v.2
ALTER TABLE test_table ALTER COLUMN name TYPE TEXT;
-- Testing DROP
DROP TABLE test_table;


