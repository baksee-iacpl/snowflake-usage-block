connection: "sf_db_east"

# include all the views
include: "*.view"

# include all the dashboards
include: "account_usage_dashboard.dashboard.lookml"

# datagroup: snowflake_usage_east_block_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "1 hour"
# }

named_value_format: conditional_to_millions {
  value_format: "[>=1000000]0,,\"M\";[>=1000]0,\"K\";0"
}

#persist_with: snowflake_usage_east_block_default_datagroup

explore: storage_usage {
  label: "Storage Usage East"
}

explore: warehouse_metering_history {
  label: "Warehouse Metering History East"
}
