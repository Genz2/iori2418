connection: "thelook"

view: orders {
  sql_table_name: demo_db.orders ;;
  dimension: status {
    drill_fields: [status]
  }
}

explore: orders {}
