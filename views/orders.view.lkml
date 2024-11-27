view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: conditional_formatting_test {
    sql: ${status} ;;
    html:
    {% if value == 'COMPLETED' %}
    <p style="color: #E84234;">{{ value }}</p>
    {% elsif value == 'CANCELLED' %}
    <p style="color: #FABB09;">{{ value }}</p>
    {% elsif value == 'PENDING' %}
    <p style="color: #32A753">{{ value }}</p>
    {% else %}
    <p style="color: #80868B;">{{value}}</p>
    {% endif %};;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
