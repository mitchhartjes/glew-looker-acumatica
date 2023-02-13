view: dim_acumatica_warehouses {
  sql_table_name: public.dim_acumatica_warehouses ;;
  view_label: "Acumatica Warehouses"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${id}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: id {
    type: string
    value_format: "0"
    sql: ${TABLE}.id ;;
  }

  dimension: glew_account_id {
    type: number
    value_format: "0"
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: receiving_location_id {
    type: string
    value_format: "0"
    sql: ${TABLE}.receiving_location_id ;;
  }

  dimension: rma_location_id {
    type: string
    value_format: "0"
    sql: ${TABLE}.rma_location_id ;;
  }

  dimension: shipping_location_id {
    type: string
    value_format: "0"
    sql: ${TABLE}.shipping_location_id ;;
  }

  dimension: warehouse_id {
    type: string
    value_format: "0"
    sql: ${TABLE}.warehouse_id ;;
  }

  measure: number_of_warehouses {
    type: count_distinct
    sql: ${warehouse_id} ;;
    description: "Distinct Count of Warehouse ID"
  }
}
