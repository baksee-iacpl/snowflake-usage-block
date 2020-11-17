connection: "sf_db_east"

# include all the views
include: "*.view"

datagroup: snowflake_usage_east_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflake_usage_east_default_datagroup
