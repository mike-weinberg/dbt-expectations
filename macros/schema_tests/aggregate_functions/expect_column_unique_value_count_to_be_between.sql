{% macro test_expect_column_unique_value_count_to_be_between(model, column_name,
                                                            minimum,
                                                            maximum,
                                                            partition_column=None,
                                                            partition_filter=None
                                                            ) %}
{% set expression %}
count(distinct {{ column_name }})
{% endset %}
{{ dbt_expectations.expression_between(model, 
                                        expression=expression,
                                        minimum=minimum, 
                                        maximum=maximum, 
                                        partition_column=partition_column, 
                                        partition_filter=partition_filter
                                        ) }}
{% endmacro %}