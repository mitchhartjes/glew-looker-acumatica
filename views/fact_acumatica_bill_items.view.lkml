view: fact_acumatica_bill_items {
  sql_table_name: public.fact_acumatica_bill_items ;;
  view_label: "Acumatica Bill Items"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${bill_id},${bill_item_id}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bill_id {
    type: string
    value_format: "0"
    sql: ${TABLE}.bill_id ;;
  }

  dimension: bill_item_id {
    type: string
    value_format: "0"
    sql: ${TABLE}.bill_item_id ;;
  }

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: extended_cost {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.extended_cost ;;
  }

  dimension: glew_account_id {
    type: number
    value_format: "0"
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: inventory_id {
    type: string
    value_format: "0"
    sql: ${TABLE}.inventory_id ;;
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

  dimension: transaction_description {
    type: string
    sql: ${TABLE}.transaction_description ;;
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

  measure: number_of_bill_items {
    type: count_distinct
    sql: ${bill_item_id} ;;
    description: "Distinct Count of Bill Item ID"
  }
  measure: sum_of_extended_cost {
    type: sum
    sql: ${TABLE}.extended_cost ;;
  }
  measure: sum_of_qty {
    type: sum
    sql: ${TABLE}.qty ;;
  }
  measure: sum_of_unit_cost {
    type: sum
    sql: ${TABLE}.unit_cost ;;
  }
}
