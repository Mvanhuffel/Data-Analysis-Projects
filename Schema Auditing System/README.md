### Step 1: Create an Audit Table

First, you need to create a table that will store the details of schema changes. This table can have columns for the type of change, the object affected, the time of the change, and other relevant details.

```
CREATE TABLE schema_audit (
    change_id SERIAL PRIMARY KEY,
    change_type VARCHAR(50),
    object_name VARCHAR(255),
    schema_name VARCHAR(50),
    change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    additional_info TEXT
);
```

### Step 2: Create Event Triggers

PostgreSQL supports event triggers that can be fired on DDL (Data Definition Language) statements like `CREATE`, `ALTER`, and `DROP`. You can create event triggers for these statements and log the changes in your audit table.

Here's an example of an event trigger for `CREATE` statements:

```
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

This trigger logs every `CREATE TABLE` statement. You can create similar triggers for other DDL statements like `ALTER TABLE` and `DROP TABLE`.

### Step 3: Query the Audit Table

To get a list of schema changes, you can simply query the audit table:

```
SELECT * FROM schema_audit ORDER BY change_timestamp DESC;
```

This will give you a list of all schema changes, sorted by the time they occurred.
