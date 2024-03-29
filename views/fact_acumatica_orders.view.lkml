view: fact_acumatica_orders {
  sql_table_name: public.fact_acumatica_orders ;;
  view_label: "Acumatica Orders"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${order_id}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: approved {
    type: yesno
    sql: ${TABLE}.approved ;;
  }

  dimension: cash_account {
    type: string
    sql: ${TABLE}.cash_account ;;
  }

  dimension: control_total {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.control_total ;;
  }

  dimension: credit_hold {
    type: yesno
    sql: ${TABLE}.credit_hold ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: currency_rate {
    type: number
    sql: ${TABLE}.currency_rate ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_order {
    type: string
    sql: ${TABLE}.customer_order ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: effective {
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
    sql: ${TABLE}.effective_date ;;
  }

  dimension: glew_account_id {
    type: number
    value_format: "0"
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: hold {
    type: yesno
    sql: ${TABLE}.hold ;;
  }

  dimension: is_tax_valid {
    type: yesno
    sql: ${TABLE}.is_tax_valid ;;
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
    sql: ${TABLE}.last_modified ;;
  }

  dimension: location_id {
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  dimension: qty {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.qty ;;
  }

  dimension_group: requested {
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
    sql: ${TABLE}.requested_date ;;
  }

  dimension: ship_via {
    type: string
    sql: ${TABLE}.ship_via ;;
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

  dimension: total {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.total ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: number_of_orders {
    type: count_distinct
    sql: ${order_id} ;;
    description: "Distinct Count of Order ID"
  }
  measure: sum_of_control_total {
    type: sum
    sql: ${TABLE}.control_total ;;
  }
  measure: sum_of_qty {
    type: sum
    sql: ${TABLE}.qty ;;
  }
  measure: sum_of_tax {
    type: sum
    sql: ${TABLE}.tax ;;
  }
  measure: sum_of_total {
    type: sum
    sql: ${TABLE}.total ;;
  }
}
