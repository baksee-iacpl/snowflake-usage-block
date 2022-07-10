view: semd_check {
  derived_table: {
    sql: select domain,searchengine, country, date, weekofyear(date) as week, dayname(date) as day,  count(distinct adid) as traffic_cnt,
      sum(cost) as cost, sum(clicks) as clicks, sum(picks) as picks, sum(revenue) as revenue, count(distinct r.campaign) as live_camps
      from analytics.semd_sonic_daily_adid r
      where  searchengine = 'google'
      group by 1,2,3,4,5,6
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: domain {
    type: string
    sql: ${TABLE}."DOMAIN" ;;
  }

  dimension: searchengine {
    type: string
    sql: ${TABLE}."SEARCHENGINE" ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: week {
    type: number
    sql: ${TABLE}."WEEK" ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}."DAY" ;;
  }

  dimension: traffic_cnt {
    type: number
    sql: ${TABLE}."TRAFFIC_CNT" ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}."COST" ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}."CLICKS" ;;
  }

  dimension: picks {
    type: number
    sql: ${TABLE}."PICKS" ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}."REVENUE" ;;
  }

  dimension: live_camps {
    type: number
    sql: ${TABLE}."LIVE_CAMPS" ;;
  }

  set: detail {
    fields: [
      domain,
      searchengine,
      country,
      date,
      week,
      day,
      traffic_cnt,
      cost,
      clicks,
      picks,
      revenue,
      live_camps
    ]
  }
}
