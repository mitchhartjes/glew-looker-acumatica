view: fact_acumatica_journal_items {
  sql_table_name: public.fact_acumatica_journal_items ;;
  view_label: "Acumatica Journal Items"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${journal_item_id},${journal_id}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: branch_id {
    type: string
    sql: ${TABLE}.branch_id ;;
  }

  dimension: credit_amount {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.credit_amount ;;
  }

  dimension: debit_amount {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.debit_amount ;;
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

  dimension: is_non_pm {
    type: yesno
    sql: ${TABLE}.is_non_pm ;;
  }

  dimension: journal_id {
    type: string
    sql: ${TABLE}.journal_id ;;
  }

  dimension: journal_item_id {
    type: string
    sql: ${TABLE}.journal_item_id ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: qty {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.qty ;;
  }

  dimension: reference_number {
    type: string
    sql: ${TABLE}.reference_number ;;
  }

  dimension: subaccount {
    type: string
    sql: ${TABLE}.subaccount ;;
  }

  dimension: transaction_description {
    type: string
    sql: ${TABLE}.transaction_description ;;
  }

  dimension: vendor_or_customer {
    type: string
    sql: ${TABLE}.vendor_or_customer ;;
  }

  measure: number_of_journal_items {
    type: count_distinct
    sql: ${journal_item_id} ;;
    description: "Distinct Count of Journal Item ID"
  }
  measure: sum_of_credit_amount {
    type: sum
    sql: ${TABLE}.credit_amount ;;
  }

  measure: sum_of_debit_amount {
    type: sum
    sql: ${TABLE}.debit_amount ;;
  }
  measure: sum_of_qty {
    type: sum
    sql: ${TABLE}.qty ;;
  }
}
