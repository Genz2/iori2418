project_name: "iori_2418"
constant: test_liquid {
  value: "{% assign abs_value = value | abs %}

{% if abs_value > 900 %}

<span>{{ value | round:0 }}M</span>

{% elsif abs_value > 800 %}

<span>{{ value | round:1 }}M</span>

{% elsif abs_value >= 700 %}

<span>{{ value | round:2 }}M</span>

{% elsif abs_value >= 600 %}

<span>{{ value |  round:0 }}K</span>

{% else %}

<span>{{ value | round:2 }}</span>

{% endif %}"
}
# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
