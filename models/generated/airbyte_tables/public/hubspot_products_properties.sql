{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_products_hashid,
    tax,
    {{ adapter.quote('name') }},
    price,
    amount,
    hs_sku,
    hs_url,
    discount,
    quantity,
    hs_images,
    createdate,
    description,
    hs_folder_id,
    hs_object_id,
    hs_createdate,
    hs_lastmodifieddate,
    hs_merged_object_ids,
    hs_cost_of_goods_sold,
    hs_created_by_user_id,
    hs_updated_by_user_id,
    hs_discount_percentage,
    hs_unique_creation_key,
    hs_avatar_filemanager_key,
    hs_user_ids_of_all_owners,
    recurringbillingfrequency,
    hs_all_accessible_team_ids,
    hs_recurring_billing_period,
    hs_recurring_billing_start_date,
    hs_all_assigned_business_unit_ids,
    hs_user_ids_of_all_notification_followers,
    hs_user_ids_of_all_notification_unfollowers,
    _airbyte_emitted_at,
    _airbyte_properties_hashid
from {{ ref('hubspot_products_properties_ab3') }}
-- properties at hubspot_products/properties from {{ ref('hubspot_products') }}
