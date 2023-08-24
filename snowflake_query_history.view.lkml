view: snowflake_query_history {
  derived_table: {
    sql:
  select query_text, user_name, role_name, warehouse_name, start_time, end_time
  from SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY where query_id in
          (select  query_id
             from snowflake.account_usage.access_history
             , lateral flatten(base_objects_accessed) f1
             where f1.value:"objectName"::string like 'PRODUCTION.CONSUMER.%'
             and f1.value:"objectDomain"::string='Table'
             and query_start_time >= dateadd('day',-90, current_timestamp())
             and user_name <> 'PHOTON_USER'
             union
             select  query_id
             from snowflake.account_usage.access_history
             , lateral flatten(base_objects_accessed) f1
             where f1.value:"objectName"::string like 'PRODUCTION.SHOPPING.%'
             and f1.value:"objectDomain"::string='Table'
             and query_start_time >= dateadd('day',-90, current_timestamp())
             and user_name <> 'PHOTON_USER'
             union
             select  query_id
             from snowflake.account_usage.access_history
             , lateral flatten(base_objects_accessed) f1
             where f1.value:"objectName"::string like 'PRODUCTION.ASKRAW.%'
             and f1.value:"objectDomain"::string='Table'
             and query_start_time >= dateadd('day',-90, current_timestamp())
             and user_name <> 'PHOTON_USER'
             union
             select  query_id
             from snowflake.account_usage.access_history
             , lateral flatten(base_objects_accessed) f1
             where f1.value:"objectName"::string like 'PRODUCTION.FLANKERS.%'
             and f1.value:"objectDomain"::string='Table'
             and query_start_time >= dateadd('day',-90, current_timestamp())
             and user_name <> 'PHOTON_USER')
    ;;
   }
  }
