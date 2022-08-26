view: fact_acumatica_shipment_items {
  sql_table_name: public.fact_acumatica_shipment_items ;;
  view_label: "Acumatica Shipment Items"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${shipment_id},${shipment_item_id}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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

  dimension: location_id {
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: open_qty {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.open_qty ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}.order_type ;;
  }

  dimension: ordered_qty {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.ordered_qty ;;
  }

  dimension: original_qty {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.original_qty ;;
  }

  dimension: shipment_id {
    type: string
    sql: ${TABLE}.shipment_id ;;
  }

  dimension: shipment_item_id {
    type: string
    sql: ${TABLE}.shipment_item_id ;;
  }

  dimension: shipped_qty {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.shipped_qty ;;
  }

  dimension: uom {
    type: string
    sql: ${TABLE}.uom ;;
  }

  dimension: warehouse_id {
    type: string
    sql: ${TABLE}.warehouse_id ;;
  }

  measure: number_of_shipment_items {
    type: count_distinct
    sql: ${shipment_item_id} ;;
    description: "Distinct Count of Shipment Item ID"
  }
  measure: sum_of_open_qty {
    type: sum
    sql: ${TABLE}.open_qty ;;
  }
  measure: sum_of_ordered_qty {
    type: sum
    sql: ${TABLE}.ordered_qty ;;
  }

  measure: sum_of_original_qty {
    type: sum
    sql: ${TABLE}.original_qty ;;
  }
  measure: sum_of_shipped_qty {
    type: sum
    sql: ${TABLE}.shipped_qty ;;
  }
}
