connection: "silo_routing"
include: "/**/*.view.lkml"                 # include all views in this project
include: "//glew_looker_glew/views/*.view.lkml"

explore: fact_acumatica_invoice_items {
  access_filter: {
    field: glew_account_id
    user_attribute: glew_account_id
  }
  label: "Invoices"
  group_label: "Acumatica"
  description: "View/Report on your Acumatica invoice and invoice item data with this explore"

  join: dim_glew_accounts {
    relationship: many_to_one
    sql_on: ${fact_acumatica_invoice_items.glew_account_id} = ${dim_glew_accounts.glew_account_id} ;;
    type: left_outer
  }
  join: fact_acumatica_invoices {
    relationship: many_to_one
    sql_on: ${fact_acumatica_invoices.glew_account_id} = ${fact_acumatica_invoice_items.glew_account_id}
      and ${fact_acumatica_invoices.invoice_id} = ${fact_acumatica_invoice_items.invoice_id};;
  }
  join: fact_exchange_rates {
    relationship: one_to_one
    sql_on: ${fact_exchange_rates.base} = ${dim_glew_accounts.currency}
      and ${fact_exchange_rates.timestamp_date} = ${fact_acumatica_invoices.timestamp_date};;
  }
}
