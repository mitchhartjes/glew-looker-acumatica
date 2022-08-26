view: fact_acumatica_shipments {
  sql_table_name: public.fact_acumatica_shipments ;;
  view_label: "Acumatica Shipments"

  dimension: primary_key {
    type: string
    sql: CONCAT(${glew_account_id},${shipment_id}) ;;
    primary_key: yes
    hidden: yes
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

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: effective {
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
    sql: ${TABLE}.effective_date ;;
  }

  dimension: freight_amount {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.freight_amount ;;
  }

  dimension: freight_cost {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.freight_cost ;;
  }

  dimension: glew_account_id {
    type: number
    sql: ${TABLE}.glew_account_id ;;
  }

  dimension: ground_collect {
    type: yesno
    sql: ${TABLE}.ground_collect ;;
  }

  dimension: hold {
    type: yesno
    sql: ${TABLE}.hold ;;
  }

  dimension: insurance {
    type: yesno
    sql: ${TABLE}.insurance ;;
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
    sql: ${TABLE}.last_modified ;;
  }

  dimension: location_id {
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: operation {
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: residential_delivery {
    type: yesno
    sql: ${TABLE}.residential_delivery ;;
  }

  dimension: saturday_delivery {
    type: yesno
    sql: ${TABLE}.saturday_delivery ;;
  }

  dimension: ship_via {
    type: string
    sql: ${TABLE}.ship_via ;;
  }

  dimension_group: shipment {
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
    sql: ${TABLE}.shipment_date ;;
  }

  dimension: shipment_id {
    type: string
    sql: ${TABLE}.shipment_id ;;
  }

  dimension: shipment_number {
    type: string
    sql: ${TABLE}.shipment_number ;;
  }

  dimension: shipped_qty {
    type: number
    group_label: "Glew Custom Measure"
    sql: ${TABLE}.shipped_qty ;;
  }

  dimension: shipping_terms {
    type: string
    sql: ${TABLE}.shipping_terms ;;
  }

  dimension: shipping_zone_id {
    type: string
    sql: ${TABLE}.shipping_zone_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: warehouse_id {
    type: string
    sql: ${TABLE}.warehouse_id ;;
  }

 measure: number_of_shipments {
  type: count_distinct
  sql: ${shipment_id} ;;
  description: "Distinct Count of Shipment ID"
}
  measure: sum_of_freight_amount {
    type: sum
    sql: ${TABLE}.freight_amount ;;
  }

  measure: sum_of_freight_cost {
    type: sum
    sql: ${TABLE}.freight_cost ;;
  }
  measure: sum_of_shipped_qty {
    type: sum
    sql: ${TABLE}.shipped_qty ;;
  }
}
