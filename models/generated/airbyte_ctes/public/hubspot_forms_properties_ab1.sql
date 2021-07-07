{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_forms_hashid,
    {{ json_extract_scalar('properties', ['hs_name']) }} as hs_name,
    {{ json_extract_scalar('properties', ['hs_object_id']) }} as hs_object_id,
    {{ json_extract('properties', ['hs_created_at']) }} as hs_created_at,
    {{ json_extract('properties', ['hs_createdate']) }} as hs_createdate,
    {{ json_extract('properties', ['hs_published_at']) }} as hs_published_at,
    {{ json_extract_scalar('properties', ['hs_asset_subtype']) }} as hs_asset_subtype,
    {{ json_extract_scalar('properties', ['hs_publish_status']) }} as hs_publish_status,
    {{ json_extract_scalar('properties', ['hs_origin_asset_id']) }} as hs_origin_asset_id,
    {{ json_extract('properties', ['hs_lastmodifieddate']) }} as hs_lastmodifieddate,
    {{ json_extract_scalar('properties', ['hs_merged_object_ids']) }} as hs_merged_object_ids,
    {{ json_extract_scalar('properties', ['hs_created_by_user_id']) }} as hs_created_by_user_id,
    {{ json_extract_scalar('properties', ['hs_updated_by_user_id']) }} as hs_updated_by_user_id,
    {{ json_extract_scalar('properties', ['hs_unique_creation_key']) }} as hs_unique_creation_key,
    {{ json_extract_scalar('properties', ['hs_user_ids_of_all_owners']) }} as hs_user_ids_of_all_owners,
    {{ json_extract_scalar('properties', ['hs_all_accessible_team_ids']) }} as hs_all_accessible_team_ids,
    {{ json_extract_scalar('properties', ['hs_all_assigned_business_unit_ids']) }} as hs_all_assigned_business_unit_ids,
    {{ json_extract_scalar('properties', ['hs_user_ids_of_all_notification_followers']) }} as hs_user_ids_of_all_notification_followers,
    {{ json_extract_scalar('properties', ['hs_user_ids_of_all_notification_unfollowers']) }} as hs_user_ids_of_all_notification_unfollowers,
    _airbyte_emitted_at
from {{ ref('hubspot_forms') }}
where properties is not null
-- properties at hubspot_forms/properties

