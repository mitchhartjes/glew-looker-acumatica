view: fact_acumatica_invoice_items {
  sql_table_name: public.fact_acumatica_invoice_items ;;
  view_label: "Acumatica Invoice Items"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${invoice_item_id},${invoice_id}) ;;
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
    sql: to_char(date_trunc('Day',${last_modified_date} - interval {% parameter week_start %}), 'YYYY-MM-DD') ;;
  }

  dimension: alternate_week_start {
    sql: date_trunc('week', ${last_modified_date} + interval {% parameter week_start %}) - interval {% parameter week_start %};;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: amount {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.amount ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount_amount {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: extended_price {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.extended_price ;;
  }

  dimension: glew_account_id {
    type: number
    value_format: "0"
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: inventory_id {
    type: string
    sql: ${TABLE}.inventory_id ;;
  }

  dimension: invoice_id {
    type: string
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: invoice_item_id {
    type: string
    sql: ${TABLE}.invoice_item_id ;;
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

  dimension: qty {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.qty ;;
  }

  dimension: subaccount {
    type: string
    sql: ${TABLE}.subaccount ;;
  }

  dimension: unit_price {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.unit_price ;;
  }

  dimension: uom {
    type: string
    sql: ${TABLE}.uom ;;
  }

 measure: number_of_invoice_items {
  type: count_distinct
  sql: ${invoice_item_id} ;;
  description: "Distinct Count of Invoice Item ID"
}
  measure: sum_of_amount {
    type: sum
    sql: ${TABLE}.amount ;;
  }
  measure: sum_of_discount_amount {
    type: sum
    sql: ${TABLE}.discount_amount ;;
  }
  measure: sum_of_extended_price {
    type: sum
    sql: ${TABLE}.extended_price ;;
  }
  measure: sum_of_qty {
    type: sum
    sql: ${TABLE}.qty ;;
  }
  measure: sum_of_unit_price {
    type: sum
    sql: ${TABLE}.unit_price ;;
  }
}
