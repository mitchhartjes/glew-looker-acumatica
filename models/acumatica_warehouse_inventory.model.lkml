connection: "silo_routing"
include: "/**/*.view.lkml"                 # include all views in this project
include: "//glew_looker_glew/views/*.view.lkml"

explore: fact_acumatica_warehouse_inventory {
  access_filter: {
    field: glew_account_id
    user_attribute: glew_account_id
  }
  label: "Warehouse Inventory"
  group_label: "Acumatica"
  description: "View/Report on your Acumatica warehouse inventory data with this explore"

  join: dim_glew_accounts {
    relationship: many_to_one
    sql_on: ${fact_acumatica_warehouse_inventory.glew_account_id} = ${dim_glew_accounts.glew_account_id} ;;
    type: left_outer
  }
  join: dim_acumatica_warehouses {
    relationship: many_to_one
    sql_on: ${fact_acumatica_warehouse_inventory.glew_account_id} = ${dim_acumatica_warehouses.glew_account_id}
      and ${fact_acumatica_warehouse_inventory.warehouse_id} = ${dim_acumatica_warehouses.warehouse_id};;
  }
}
