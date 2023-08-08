view: fact_acumatica_purchase_orders {
  sql_table_name: public.fact_acumatica_purchase_orders ;;
  view_label: "Acumatica Purchase Orders"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${po_id}) ;;
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

  dimension: alternate_day_start {
    sql: to_char(date_trunc('Day',${timestamp_date} - interval {% parameter week_start %}), 'YYYY-MM-DD') ;;
  }

  dimension: alternate_week_start {
    sql: date_trunc('week', ${timestamp_date} + interval {% parameter week_start %}) - interval {% parameter week_start %};;
  }

  dimension: control_total {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.control_total ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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

  dimension: line_item_total {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.line_item_total ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: po_id {
    type: string
    sql: ${TABLE}.po_id ;;
  }

  dimension_group: promised {
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
    sql: ${TABLE}.promised_on ;;
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

  dimension: total {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.total ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_reference {
    type: string
    sql: ${TABLE}.vendor_reference ;;
  }

  measure: number_of_purchase_orders {
    type: count_distinct
    sql: ${po_id} ;;
    description: "Distinct Count of PO ID"
  }
  measure: sum_of_control_total {
    type: sum
    sql: ${TABLE}.control_total ;;
  }
  measure: sum_of_line_item_total {
    type: sum
    sql: ${TABLE}.line_item_total ;;
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
