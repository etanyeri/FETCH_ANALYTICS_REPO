-- Create Database and Schema:

resource "snowflake_database" "data_warehouse" {
  name = "DATA_WAREHOUSE"
}

resource "snowflake_schema" "my_schema" {
  name     = "FETCH_RAW_SCHEMA"
  database = snowflake_database.data_warehouse.name
}

-- Create Staging Area for Data Files:
resource "snowflake_stage" "my_stage" {
  name     = "RAW_STAGE"
  schema   = snowflake_schema.FETCH_RAW_SCHEMA.name
  file_format = "JSON"
  comment  = "Stage for receipts,brands and user data"
}

-- Create Tables:

resource "snowflake_table" "users" {
  name    = "users"
  schema  = snowflake_schema.FETCH_RAW_SCHEMA.name
  comment = "User data table"

  column {
    name = "USER_ID"
    type = "STRING"
  }

  column {
    name = "STATE"
    type = "STRING"
  }

  column {
    name = "CREATED_DATE"
    type = "DATE"
  }

  column {
    name = "LAST_LOGIN"
    type = "DATE"
  }

  column {
    name = "ROLE"
    type = "STRING"
  }

  column {
    name = "ACTIVE"
    type = "BOOLEAN"
  }
} ....
