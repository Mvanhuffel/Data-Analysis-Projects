# Schema Auditing System
The project develops a system to log and monitor changes in database schemas, inspired by a discussion on r/dataengineering. This system aims to provide a comprehensive record of schema modifications over time, assisting in understanding the database's structural evolution, and facilitating debugging and troubleshooting.

## Objectives
- **Change Tracking**: Implement a mechanism to log detailed records of database schema changes over time, aiding in the analysis of the database's structural evolution.
- **Debugging and Troubleshooting**: Utilize the schema change log to diagnose and resolve issues stemming from recent modifications to the database structure.
- **Collaboration and Communication**: Foster better communication and collaboration among teams or developers working on the same database by providing a clear record of schema changes.

## Methodology
### 1. Audit Table Creation
- **Audit table setup**: Established a dedicated table within the database to record details of schema changes, including the type of change, the affected object, the timestamp of the change, and other important details.

```ruby
CREATE TABLE schema_audit (
    change_id SERIAL PRIMARY KEY,
    change_type VARCHAR(50),
    object_name VARCHAR(255),
    schema_name VARCHAR(50),
    change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    additional_info TEXT
);
```

### 2. Event Triggers Implementation
- **DDL statement monitoring**: Configured event triggers within the database to respond to DDL (Data Definition Language) statements (e.g, CREATE, ALTER, and DROP), ensuring that every schema change is logged in the audit table.

This trigger logs every `CREATE TABLE` statement:

```ruby
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
```

### 3. Schema Change Logging
- **Continuous monitoring**: The system continually monitors for DDL statements, logging each event in the audit table to provide a real-time, chronological record of schema changes.

To get a list of schema changes, simply query the audit table:

```
SELECT * FROM schema_audit ORDER BY change_timestamp DESC;
```

| ![schema_table](schema_table.png) |
|:--:| 
| *schema_audit table* |
