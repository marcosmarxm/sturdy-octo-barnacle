{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_products_hashid,
    cast(tax as {{ dbt_utils.type_float() }}) as tax,
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast(price as {{ dbt_utils.type_float() }}) as price,
    cast(amount as {{ dbt_utils.type_float() }}) as amount,
    cast(hs_sku as {{ dbt_utils.type_string() }}) as hs_sku,
    cast(hs_url as {{ dbt_utils.type_string() }}) as hs_url,
    cast(discount as {{ dbt_utils.type_float() }}) as discount,
    cast(quantity as {{ dbt_utils.type_float() }}) as quantity,
    cast(hs_images as {{ dbt_utils.type_string() }}) as hs_images,
    createdate,
    cast(description as {{ dbt_utils.type_string() }}) as description,
    cast(hs_folder_id as {{ dbt_utils.type_float() }}) as hs_folder_id,
    cast(hs_object_id as {{ dbt_utils.type_float() }}) as hs_object_id,
    hs_createdate,
    hs_lastmodifieddate,
    cast(hs_merged_object_ids as {{ dbt_utils.type_string() }}) as hs_merged_object_ids,
    cast(hs_cost_of_goods_sold as {{ dbt_utils.type_float() }}) as hs_cost_of_goods_sold,
    cast(hs_created_by_user_id as {{ dbt_utils.type_float() }}) as hs_created_by_user_id,
    cast(hs_updated_by_user_id as {{ dbt_utils.type_float() }}) as hs_updated_by_user_id,
    cast(hs_discount_percentage as {{ dbt_utils.type_float() }}) as hs_discount_percentage,
    cast(hs_unique_creation_key as {{ dbt_utils.type_string() }}) as hs_unique_creation_key,
    cast(hs_avatar_filemanager_key as {{ dbt_utils.type_string() }}) as hs_avatar_filemanager_key,
    cast(hs_user_ids_of_all_owners as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_owners,
    cast(recurringbillingfrequency as {{ dbt_utils.type_string() }}) as recurringbillingfrequency,
    cast(hs_all_accessible_team_ids as {{ dbt_utils.type_string() }}) as hs_all_accessible_team_ids,
    cast(hs_recurring_billing_period as {{ dbt_utils.type_string() }}) as hs_recurring_billing_period,
    cast(hs_recurring_billing_start_date as {{ dbt_utils.type_string() }}) as hs_recurring_billing_start_date,
    cast(hs_all_assigned_business_unit_ids as {{ dbt_utils.type_string() }}) as hs_all_assigned_business_unit_ids,
    cast(hs_user_ids_of_all_notification_followers as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_notification_followers,
    cast(hs_user_ids_of_all_notification_unfollowers as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_notification_unfollowers,
    _airbyte_emitted_at
from {{ ref('hubspot_products_properties_ab1') }}
-- properties at hubspot_products/properties

