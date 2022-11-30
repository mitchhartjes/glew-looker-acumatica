view: fact_acumatica_purchase_order_items {
  sql_table_name: public.fact_acumatica_purchase_order_items ;;
  view_label: "Acumatica Purchase Order Items"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${po_id},${po_item_id}) ;;
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
    sql: date_trunc('week', ${requested_date} + interval {% parameter week_start %}) - interval {% parameter week_start %};;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: branch_id {
    type: string
    sql: ${TABLE}.branch_id ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.cancelled ;;
  }

  dimension: completed {
    type: yesno
    sql: ${TABLE}.completed ;;
  }

  dimension: cost {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.cost ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: glew_account_id {
    type: number
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: inventory_id {
    type: string
    sql: ${TABLE}.inventory_id ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: po_id {
    type: string
    sql: ${TABLE}.po_id ;;
  }

  dimension: po_item_id {
    type: string
    sql: ${TABLE}.po_item_id ;;
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
    sql: ${TABLE}.promised ;;
  }

  dimension: qty {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.qty ;;
  }

  dimension: qty_on_receipts {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.qty_on_receipts ;;
  }

  dimension: receipt_action {
    type: string
    sql: ${TABLE}.receipt_action ;;
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
    sql: ${TABLE}.requested ;;
  }

  dimension: subaccount {
    type: string
    sql: ${TABLE}.subaccount ;;
  }

  dimension: tax_category {
    type: string
    sql: ${TABLE}.tax_category ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unit_cost {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.unit_cost ;;
  }

  dimension: uom {
    type: string
    sql: ${TABLE}.uom ;;
  }

  dimension: warehouse_id {
    type: string
    sql: ${TABLE}.warehouse_id ;;
  }

  measure: number_of_purchase_order_items {
    type: count_distinct
    sql: ${po_item_id} ;;
    description: "Distinct Count of PO Item ID"
  }
  measure: sum_of_cost {
    type: sum
    sql: ${TABLE}.cost ;;
  }
  measure: sum_of_qty {
    type: sum
    sql: ${TABLE}.qty ;;
  }

  measure: sum_of_qty_on_receipts {
    type: sum
    sql: ${TABLE}.qty_on_receipts ;;
  }
  measure: sum_of_unit_cost {
    type: sum
    sql: ${TABLE}.unit_cost ;;
  }
}
