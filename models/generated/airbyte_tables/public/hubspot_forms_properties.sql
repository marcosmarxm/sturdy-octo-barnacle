{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_forms_hashid,
    hs_name,
    hs_object_id,
    hs_created_at,
    hs_createdate,
    hs_published_at,
    hs_asset_subtype,
    hs_publish_status,
    hs_origin_asset_id,
    hs_lastmodifieddate,
    hs_merged_object_ids,
    hs_created_by_user_id,
    hs_updated_by_user_id,
    hs_unique_creation_key,
    hs_user_ids_of_all_owners,
    hs_all_accessible_team_ids,
    hs_all_assigned_business_unit_ids,
    hs_user_ids_of_all_notification_followers,
    hs_user_ids_of_all_notification_unfollowers,
    _airbyte_emitted_at,
    _airbyte_properties_hashid
from {{ ref('hubspot_forms_properties_ab3') }}
-- properties at hubspot_forms/properties from {{ ref('hubspot_forms') }}

