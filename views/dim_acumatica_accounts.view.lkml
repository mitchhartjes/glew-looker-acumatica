view: dim_acumatica_accounts {
  sql_table_name: public.dim_acumatica_accounts ;;
  view_label: "Acumatica Accounts"

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

  dimension: account_class {
    type: string
    sql: ${TABLE}.account_class ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_number {
    type: string
    sql: ${TABLE}.account_number ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: cash_account {
    type: yesno
    sql: ${TABLE}.cash_account ;;
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

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: glew_account_id {
    type: number
    sql: ${TABLE}.glew_account_id ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: require_units {
    type: yesno
    sql: ${TABLE}.require_units ;;
  }

  dimension: secured {
    type: yesno
    sql: ${TABLE}.secured ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: use_default_subaccount {
    type: yesno
    sql: ${TABLE}.use_default_subaccount ;;
  }

  measure: number_of_accounts {
    type: count_distinct
    sql: ${account_id} ;;
    description: "Distinct Count of Account ID"
  }
}
