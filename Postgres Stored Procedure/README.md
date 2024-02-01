# Automating Timestamp Updates in PostgreSQL
This project showcases the automation of updating timestamp columns in a PostgreSQL database through the use of stored procedures and triggers. By automating the updated_at timestamp update process, this system enhances data management efficiency within a PostgreSQL environment.

## Objectives
- **Automated Timestamp Management**: Implement a system to automatically update the updated_at column in a database table whenever a row is modified.
- **Data Management Efficiency**: Demonstrate the advantages of using stored procedures and triggers over manual timestamp updates in terms of efficiency and reliability.

## Methodology
### 1. Transaction Table Creation
- **Table setup**: Created a transaction table with columns for transaction details, including id, account_id, amount, created_at, and updated_at. The created_at and updated_at columns are set to the current timestamp by default.

```sql
CREATE TABLE transaction (
    id SERIAL PRIMARY KEY,
    account_id INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);
```

### 2. Stored Procedure and Trigger Definition
- **Stored procedure creation**: Developed the trigger_set_timestamp stored procedure to update the updated_at column to the current timestamp during row updates.
- **Trigger implementation**: Established the set_timestamp trigger, which invokes the trigger_set_timestamp procedure before any update operation on the transaction table, ensuring the updated_at column is automatically updated.

```sql
-- Stored procedure
create or replace function trigger_set_timestamp()
returns trigger as $$
begin
new.updated_at=now();
return new;
end;
$$ language plpgsql;

-- Trigger
create trigger set_timestamp
before update on transaction
for each row
execute procedure trigger_set_timestamp();
```

### 3. Automation vs. Manual Update Comparison
- **Efficiency analysis**: Compared the automated timestamp update process facilitated by the trigger and stored procedure with manual timestamp updates, highlighting the efficiency and reliability benefits of automation.

```sql
-- Update statement after the trigger was added:
UPDATE transaction 
SET amount = amount + 1
WHERE account_id = 1
RETURNING *;

-- Update statement without the trigger
UPDATE transaction 
SET amount = amount + 1,
    updated_at = NOW()
WHERE account_id = 1
RETURNING *;
```

## Project files
The repo contains all project files, including the SQL script automate_datetime_update.sql for setting up the transaction table, the stored procedure, and the trigger.

## Prerequisites
For deployment or contribution to this project, the following are necessary:
- PostgreSQL database
- Familiarity with SQL, stored procedures, and triggers
