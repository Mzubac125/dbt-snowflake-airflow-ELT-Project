{% snapshot dimcustomer_history %}

{{
    config(
        target_schema='snapshots', 
        unique_key='subscription_id',  
        strategy='check',  
        check_cols=['status'],  
        invalidate_hard_deletes=True  
    )
}}

SELECT *
FROM pc_dbt_db.dbt_mzubac.dimcustomer

{% endsnapshot %}
