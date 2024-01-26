The project demonstrates automating the update of a datetime column in a PostgreSQL database using stored procedures and triggers to streamline data management. 

A table named transaction is created with columns for transaction details, including created_at and updated_at timestamps. A stored procedure, trigger_set_timestamp, is defined to update the updated_at column to the current timestamp whenever a row is updated. This functionality is implemented through a trigger, set_timestamp, which is activated before any update operation on the transaction table. 

The project contrasts the efficiency of this automated approach with the manual updating of the datetime column, showcasing the benefits of using triggers and stored procedures in database management.

## Project files
```automate_datetime_update.sql```: Contains sample data and instructions on how to create the automation described above. Link to file [here](https://github.com/Mvanhuffel/Data_Analysis_Projects/blob/main/Postgres%20Stored%20Procedure/automate_datetime_update.sql).
