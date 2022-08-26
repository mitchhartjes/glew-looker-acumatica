connection: "silo_routing"
include: "/**/*.view.lkml"                 # include all views in this project
include: "//glew_looker_glew/views/*.view.lkml"

explore: fact_acumatica_shipment_items {
  access_filter: {
    field: glew_account_id
    user_attribute: glew_account_id
  }
  label: "Shipments"
  group_label: "Acumatica"
  description: "View/Report on your Acumatica shipment and shipment item data with this explore"

  join: dim_glew_accounts {
    relationship: many_to_one
    sql_on: ${fact_acumatica_shipment_items.glew_account_id} = ${dim_glew_accounts.glew_account_id} ;;
    type: left_outer
  }
  join: fact_acumatica_shipments {
    relationship: many_to_one
    sql_on: ${fact_acumatica_shipments.glew_account_id} = ${fact_acumatica_shipment_items.glew_account_id}
      and ${fact_acumatica_shipments.shipment_id} = ${fact_acumatica_shipment_items.shipment_id};;
  }
  join: fact_exchange_rates {
    relationship: one_to_one
    sql_on: ${fact_exchange_rates.base} = ${dim_glew_accounts.currency}
      and ${fact_exchange_rates.timestamp_date} = ${fact_acumatica_shipments.created_date};;
  }
  join: dim_acumatica_customers {
    relationship: many_to_one
    sql_on: ${fact_acumatica_shipments.glew_account_id} = ${dim_acumatica_customers.glew_account_id}
      and ${fact_acumatica_shipments.customer_id} = ${dim_acumatica_customers.customer_id};;
  }
  join: dim_acumatica_warehouses {
    relationship: many_to_one
    sql_on: ${fact_acumatica_shipments.glew_account_id} = ${dim_acumatica_warehouses.glew_account_id}
      and ${fact_acumatica_shipments.warehouse_id} = ${dim_acumatica_warehouses.warehouse_id};;
  }
}
