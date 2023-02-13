view: dim_acumatica_subaccounts {
  sql_table_name: public.dim_acumatica_subaccounts ;;
  view_label: "Acumatica Subaccounts"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${id}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
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

  dimension: secured {
    type: yesno
    sql: ${TABLE}.secured ;;
  }

  dimension: subaccount_id {
    type: number
    value_format: "0"
    sql: ${TABLE}.subaccount_id ;;
  }

  dimension: subaccount_number {
    type: string
    sql: ${TABLE}.subaccount_number ;;
  }

  measure: number_of_subaccounts {
    type: count_distinct
    sql: ${subaccount_id} ;;
    description: "Distinct Count of Subaccount ID"
  }
}
