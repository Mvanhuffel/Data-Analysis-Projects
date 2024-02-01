-- Table
CREATE TABLE transaction (
    id SERIAL PRIMARY KEY,
    account_id INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);

-- Adding sample data into table 
insert into transaction (account_id, amount)
values (1,1);

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

-- Update statement after the trigger was added
update transaction 
set amount = amount + 1
where account_id = 1
RETURNING *;

-- Update statement without the trigger, requires manual input
update transaction 
set amount = amount + 1,
    updated_at = NOW()
where account_id = 1
RETURNING *;
