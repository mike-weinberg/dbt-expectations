{{
    config(
        materialized = 'table'
    )
}}
with date_dimension as (
    {{ dbt_date.get_base_dates(n_dateparts=12, datepart='month') }}
),
add_row_values as (

    select
        d.date_day,
        cast(floor(100*rand()) as {{ dbt_utils.type_int() }}) as row_value
    from
        date_dimension d
),
add_logs as (

    select 
        *,
        log(nullif(row_value, 0)) as row_value_log
    from
        add_row_values
)
select 
    *
from
    add_logs
