{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_products_hashid,
    {{ json_extract_scalar('properties', ['tax']) }} as tax,
    {{ json_extract_scalar('properties', ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('properties', ['price']) }} as price,
    {{ json_extract_scalar('properties', ['amount']) }} as amount,
    {{ json_extract_scalar('properties', ['hs_sku']) }} as hs_sku,
    {{ json_extract_scalar('properties', ['hs_url']) }} as hs_url,
    {{ json_extract_scalar('properties', ['discount']) }} as discount,
    {{ json_extract_scalar('properties', ['quantity']) }} as quantity,
    {{ json_extract_scalar('properties', ['hs_images']) }} as hs_images,
    {{ json_extract('properties', ['createdate']) }} as createdate,
    {{ json_extract_scalar('properties', ['description']) }} as description,
    {{ json_extract_scalar('properties', ['hs_folder_id']) }} as hs_folder_id,
    {{ json_extract_scalar('properties', ['hs_object_id']) }} as hs_object_id,
    {{ json_extract('properties', ['hs_createdate']) }} as hs_createdate,
    {{ json_extract('properties', ['hs_lastmodifieddate']) }} as hs_lastmodifieddate,
    {{ json_extract_scalar('properties', ['hs_merged_object_ids']) }} as hs_merged_object_ids,
    {{ json_extract_scalar('properties', ['hs_cost_of_goods_sold']) }} as hs_cost_of_goods_sold,
    {{ json_extract_scalar('properties', ['hs_created_by_user_id']) }} as hs_created_by_user_id,
    {{ json_extract_scalar('properties', ['hs_updated_by_user_id']) }} as hs_updated_by_user_id,
    {{ json_extract_scalar('properties', ['hs_discount_percentage']) }} as hs_discount_percentage,
    {{ json_extract_scalar('properties', ['hs_unique_creation_key']) }} as hs_unique_creation_key,
    {{ json_extract_scalar('properties', ['hs_avatar_filemanager_key']) }} as hs_avatar_filemanager_key,
    {{ json_extract_scalar('properties', ['hs_user_ids_of_all_owners']) }} as hs_user_ids_of_all_owners,
    {{ json_extract_scalar('properties', ['recurringbillingfrequency']) }} as recurringbillingfrequency,
    {{ json_extract_scalar('properties', ['hs_all_accessible_team_ids']) }} as hs_all_accessible_team_ids,
    {{ json_extract_scalar('properties', ['hs_recurring_billing_period']) }} as hs_recurring_billing_period,
    {{ json_extract_scalar('properties', ['hs_recurring_billing_start_date']) }} as hs_recurring_billing_start_date,
    {{ json_extract_scalar('properties', ['hs_all_assigned_business_unit_ids']) }} as hs_all_assigned_business_unit_ids,
    {{ json_extract_scalar('properties', ['hs_user_ids_of_all_notification_followers']) }} as hs_user_ids_of_all_notification_followers,
    {{ json_extract_scalar('properties', ['hs_user_ids_of_all_notification_unfollowers']) }} as hs_user_ids_of_all_notification_unfollowers,
    _airbyte_emitted_at
from {{ ref('hubspot_products') }}
where properties is not null
-- properties at hubspot_products/properties

