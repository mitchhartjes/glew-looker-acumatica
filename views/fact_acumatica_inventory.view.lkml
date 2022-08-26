view: fact_acumatica_inventory {
  sql_table_name: public.fact_acumatica_inventory ;;
  view_label: "Acumatica Inventory"

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

  dimension: average_cost {
    type: number
    sql: ${TABLE}.average_cost ;;
  }

  dimension: base_uom {
    type: string
    sql: ${TABLE}.base_uom ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.class ;;
  }

  dimension: cogs_account {
    type: string
    sql: ${TABLE}.cogs_account ;;
  }

  dimension: cogs_subaccount {
    type: string
    sql: ${TABLE}.cogs_subaccount ;;
  }

  dimension: glew_account_id {
    type: number
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: inventory_account {
    type: string
    sql: ${TABLE}.inventory_account ;;
  }

  dimension: inventory_id {
    type: string
    sql: ${TABLE}.inventory_id ;;
  }

  dimension: inventory_subaccount {
    type: string
    sql: ${TABLE}.inventory_subaccount ;;
  }

  dimension: is_kit {
    type: yesno
    sql: ${TABLE}.is_kit ;;
  }

  dimension: last_cost {
    type: number
    sql: ${TABLE}.last_cost ;;
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

  dimension: max_cost {
    type: number
    sql: ${TABLE}.max_cost ;;
  }

  dimension: min_cost {
    type: number
    sql: ${TABLE}.min_cost ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}
