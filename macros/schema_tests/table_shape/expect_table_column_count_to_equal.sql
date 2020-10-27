{%- macro test_expect_table_column_count_to_equal(model, expected_number_of_columns) -%}
{%- set number_actual_columns = (adapter.get_columns_in_relation(model) | length) -%}
select {{ (number_actual_columns - expected_number_of_columns) | abs }}
{%- endmacro -%}