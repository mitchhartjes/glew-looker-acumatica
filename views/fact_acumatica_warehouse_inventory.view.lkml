view: fact_acumatica_warehouse_inventory {
  sql_table_name: public.fact_acumatica_warehouse_inventory ;;
  view_label: "Acumatica Warehouse Inventory"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${warehouse_inventory_id},${warehouse_id},${inventory_id}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: default_issue_location_id {
    type: string
    sql: ${TABLE}.default_issue_location_id ;;
  }

  dimension: default_receipt_location_id {
    type: string
    sql: ${TABLE}.default_receipt_location_id ;;
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

  dimension: qty_on_hand {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.qty_on_hand ;;
  }

  dimension: replenishment_source {
    type: string
    sql: ${TABLE}.replenishment_source ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: warehouse_id {
    type: string
    sql: ${TABLE}.warehouse_id ;;
  }

  dimension: warehouse_inventory_id {
    type: string
    sql: ${TABLE}.warehouse_inventory_id ;;
  }
  measure: sum_of_qty_on_hand {
    type: sum
    sql: ${TABLE}.qty_on_hand ;;
  }
}
