connection: "silo_routing"
include: "/**/*.view.lkml"                 # include all views in this project
include: "//glew_looker_glew/views/*.view.lkml"

explore: fact_acumatica_journal_items {
  access_filter: {
    field: glew_account_id
    user_attribute: glew_account_id
  }
  label: "Journals"
  group_label: "Acumatica"
  description: "View/Report on your Acumatica journal and journal item data with this explore"

  join: dim_glew_accounts {
    relationship: many_to_one
    sql_on: ${fact_acumatica_journal_items.glew_account_id} = ${dim_glew_accounts.glew_account_id} ;;
    type: left_outer
  }
  join: fact_acumatica_journals {
    relationship: many_to_one
    sql_on: ${fact_acumatica_journals.glew_account_id} = ${fact_acumatica_journal_items.glew_account_id}
      and ${fact_acumatica_journals.id} = ${fact_acumatica_journal_items.journal_id};;
  }
  join: fact_exchange_rates {
    relationship: one_to_one
    sql_on: ${fact_exchange_rates.base} = ${dim_glew_accounts.currency}
      and ${fact_exchange_rates.timestamp_date} = ${fact_acumatica_journals.transaction_date};;
  }
}
