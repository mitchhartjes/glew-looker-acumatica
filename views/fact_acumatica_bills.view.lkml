view: fact_acumatica_bills {
  sql_table_name: public.fact_acumatica_bills ;;
  view_label: "Acumatica Bills"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${bill_id}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: amount {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.amount ;;
  }

  dimension: approved_for_payment {
    type: yesno
    sql: ${TABLE}.approved_for_payment ;;
  }

  dimension: balance {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.balance ;;
  }

  dimension: bill_id {
    type: string
    value_format: "0"
    sql: ${TABLE}.bill_id ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: due {
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
    sql: ${TABLE}.due_date ;;
  }

  dimension: glew_account_id {
    type: number
    value_format: "0"
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: post_period {
    type: string
    sql: ${TABLE}.post_period ;;
  }

  dimension: reference_number {
    type: string
    sql: ${TABLE}.reference_number ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tax {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.tax ;;
  }

  dimension: terms {
    type: string
    sql: ${TABLE}.terms ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }

  dimension: vendor_reference {
    type: string
    sql: ${TABLE}.vendor_reference ;;
  }

  measure: number_of_bills {
    type: count_distinct
    sql: ${bill_id} ;;
    description: "Distinct Count of Bill ID"
  }
  measure: sum_of_amount {
    type: sum
    sql: ${TABLE}.amount ;;
  }
  measure: sum_of_balance {
    type: sum
    sql: ${TABLE}.balance ;;
  }
  measure: sum_of_tax {
    type: sum
    sql: ${TABLE}.tax ;;
  }
}
