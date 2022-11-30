view: fact_acumatica_order_items {
  sql_table_name: public.fact_acumatica_order_items ;;
  view_label: "Acumatica Order Items"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${order_item_id},${order_id}) ;;
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
    sql: date_trunc('week', ${ship_date} + interval {% parameter week_start %}) - interval {% parameter week_start %};;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: average_cost {
    type: number
    sql: ${TABLE}.average_cost ;;
  }

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.discount ;;
  }

  dimension: extended_price {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.extended_price ;;
  }

  dimension: free_item {
    type: yesno
    sql: ${TABLE}.free_item ;;
  }

  dimension: glew_account_id {
    type: number
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: inventory_id {
    type: string
    sql: ${TABLE}.inventory_id ;;
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

  dimension: manual_discount {
    type: yesno
    sql: ${TABLE}.manual_discount ;;
  }

  dimension: open_qty {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.open_qty ;;
  }

  dimension: operation {
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_item_id {
    type: string
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: qty {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.qty ;;
  }

  dimension: qty_on_shipments {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.qty_on_shipments ;;
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
    sql: ${TABLE}.requested_on ;;
  }

  dimension_group: ship {
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
    sql: ${TABLE}.ship_on ;;
  }

  dimension: shipping_rule {
    type: string
    sql: ${TABLE}.shipping_rule ;;
  }

  dimension: tax_category {
    type: string
    sql: ${TABLE}.tax_category ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unbilled_amount {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.unbilled_amount ;;
  }

  dimension: unit_cost {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.unit_cost ;;
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

  dimension: warehouse_id {
    type: string
    sql: ${TABLE}.warehouse_id ;;
  }

  measure: number_of_order_items {
    type: count_distinct
    sql: ${order_item_id} ;;
    description: "Distinct Count of Order Item ID"
  }
  measure: sum_of_discount {
    type: sum
    sql: ${TABLE}.discount ;;
  }

  measure: sum_of_extended_price {
    type: sum
    sql: ${TABLE}.extended_price ;;
  }
  measure: sum_of_open_qty {
    type: sum
    sql: ${TABLE}.open_qty ;;
  }
  measure: sum_of_qty {
    type: sum
    sql: ${TABLE}.qty ;;
  }

  measure: sum_of_qty_on_shipments {
    type: sum
    sql: ${TABLE}.qty_on_shipments ;;
  }
  measure: sum_of_unbilled_amount {
    type: sum
    sql: ${TABLE}.unbilled_amount ;;
  }

  measure: sum_of_unit_cost {
    type: sum
    sql: ${TABLE}.unit_cost ;;
  }

  measure: sum_of_unit_price {
    type: sum
    sql: ${TABLE}.unit_price ;;
  }
}
