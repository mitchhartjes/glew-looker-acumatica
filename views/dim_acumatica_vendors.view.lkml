view: dim_acumatica_vendors {
  sql_table_name: public.dim_acumatica_vendors ;;
  view_label: "Acumatica Vendors"

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

  dimension: ap_account {
    type: string
    sql: ${TABLE}.ap_account ;;
  }

  dimension: ap_subaccount {
    type: string
    sql: ${TABLE}.ap_subaccount ;;
  }

  dimension: cash_account {
    type: string
    sql: ${TABLE}.cash_account ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.class ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: foreign_entity {
    type: yesno
    sql: ${TABLE}.foreign_entity ;;
  }

  dimension: glew_account_id {
    type: number
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: landed_cost_vendor {
    type: yesno
    sql: ${TABLE}.landed_cost_vendor ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  measure: number_of_vendors {
    type: count_distinct
    sql: ${vendor_id} ;;
    description: "Distinct Count of Vendor ID"
  }
}
