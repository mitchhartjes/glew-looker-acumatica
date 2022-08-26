view: fact_acumatica_journals {
  sql_table_name: public.fact_acumatica_journals ;;
  view_label: "Acumatica Journals"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${id}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: batch_number {
    type: string
    sql: ${TABLE}.batch_number ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw,
      time,
      date,
      hour_of_day,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year]
    sql: ${TABLE}.created_date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: glew_account_id {
    type: number
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: hold {
    type: yesno
    sql: ${TABLE}.hold ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [raw,
      time,
      date,
      hour_of_day,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: ledger_id {
    type: string
    sql: ${TABLE}.ledger_id ;;
  }

  dimension: module {
    type: string
    sql: ${TABLE}.module ;;
  }

  dimension: post_period {
    type: string
    sql: ${TABLE}.post_period ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: transaction {
    type: time
    timeframes: [raw,
      time,
      date,
      hour_of_day,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year]
    sql: ${TABLE}.transaction_date ;;
  }

 measure: number_of_journals {
  type: count_distinct
  sql: ${ledger_id} ;;
  description: "Distinct Count of Ledger ID"
}
}
