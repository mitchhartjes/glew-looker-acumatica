view: fact_acumatica_invoices {
  sql_table_name: public.fact_acumatica_invoices ;;
  view_label: "Acumatica Invoices"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${invoice_id}) ;;
    primary_key: yes
    hidden: yes
  }

  parameter: week_start {
    type: string
    allowed_value: {
      label: "Monday"
      value: "0 day"
    }
    allowed_value: {
      label: "Tuesday"
      value: "6 day"
    }
    allowed_value: {
      label: "Wednesday"
      value: "5 day"
    }
    allowed_value: {
      label: "Thursday"
      value: "4 day"
    }
    allowed_value: {
      label: "Friday"
      value: "3 day"
    }
    allowed_value: {
      label: "Saturday"
      value: "2 day"
    }
    allowed_value: {
      label: "Sunday"
      value: "1 day"
    }
  }

  dimension: alternate_week_start {
    sql: date_trunc('week', ${timestamp_date} + interval {% parameter week_start %}) - interval {% parameter week_start %};;
  }

  dimension: amount {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.amount ;;
  }

  dimension: balance {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.balance ;;
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

  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: customer_order {
    type: string
    sql: ${TABLE}.customer_order ;;
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

  dimension: hold {
    type: yesno
    sql: ${TABLE}.hold ;;
  }

  dimension: invoice_id {
    type: string
    sql: ${TABLE}.invoice_id ;;
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

  dimension: link_ar_account {
    type: string
    sql: ${TABLE}.link_ar_account ;;
  }

  dimension: location_id {
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: post_period {
    type: string
    sql: ${TABLE}.post_period ;;
  }

  dimension: referenc_number {
    type: string
    sql: ${TABLE}.referenc_number ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tax_total {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.tax_total ;;
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

 measure: number_of_invoices {
  type: count_distinct
  sql: ${invoice_id} ;;
  description: "Distinct Count of Invoice ID"
}
  measure: sum_of_amount {
    type: sum
    sql: ${TABLE}.amount ;;
  }

  measure: sum_of_balance {
    type: sum
    sql: ${TABLE}.balance ;;
  }
  measure: sum_of_tax_total {
    type: sum
    sql: ${TABLE}.tax_total ;;
  }
}
