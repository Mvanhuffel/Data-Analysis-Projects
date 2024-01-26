--table
CREATE TABLE transaction (
    id SERIAL PRIMARY KEY,
    account_id INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);

--Add sample data into table 
insert into transaction (account_id, amount)
values (1,1);

-- Store procedure
create or replace function trigger_set_timestamp()
returns trigger as $$
begin
new.updated_at=now();
return new;
end;
$$ language plpgsql;

-- Create trigger
create trigger set_timestamp
before update on transaction
for each row
execute procedure trigger_set_timestamp();

--update statement after the trigger was added:
update transaction 
set amount=amount+1
where account_id = 1
returning *;

--update statement without the trigger, requires manual input:
update concurrency 
set howmuch=howmuch+1,
updated_at=now()
where account_id = 1
returning *;
