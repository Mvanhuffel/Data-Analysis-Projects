When working with databases, it's important to keep track of when data is updated or inserted. 
One common way to do this is to have a column in your table that records the time of the last update. 
However, manually updating this column every time you insert or update data can be tedious and error-prone. 
That's where stored procedures and triggers come in.

Here is an example that sets up a trigger to automatically update the datetime column of a row whenever 
an update operation is performed on the table. The stored procedure is used to define the functionality of the trigger.

## Project files
```automate_datetime_update.sql```: Contains sample data and instructions on how to create the automation described above. Link to file [here](https://github.com/Mvanhuffel/Data_Analysis_Projects/blob/main/Postgres%20Stored%20Procedure/automate_datetime_update.sql).
