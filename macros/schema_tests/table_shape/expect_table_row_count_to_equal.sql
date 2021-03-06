{%- macro test_expect_table_row_count_to_equal(model, 
                                                expected_number_of_rows, 
                                                partition_column=None,
                                                partition_filter=None
                                                ) -%}
{% set filter_cond = partition_column ~ " " ~ partition_filter if partition_column and partition_filter else None %}
{% set expression %}
count(*) = {{ expected_number_of_rows }}
{% endset %}
{{ dbt_expectations.expression_is_true(model, 
                                        expression=expression,
                                        filter_cond=filter_cond)
                                        }}
{%- endmacro -%}