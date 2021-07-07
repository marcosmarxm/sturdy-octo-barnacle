{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_forms_hashid,
    cast(hs_name as {{ dbt_utils.type_string() }}) as hs_name,
    cast(hs_object_id as {{ dbt_utils.type_float() }}) as hs_object_id,
    hs_created_at,
    hs_createdate,
    hs_published_at,
    cast(hs_asset_subtype as {{ dbt_utils.type_string() }}) as hs_asset_subtype,
    cast(hs_publish_status as {{ dbt_utils.type_string() }}) as hs_publish_status,
    cast(hs_origin_asset_id as {{ dbt_utils.type_string() }}) as hs_origin_asset_id,
    hs_lastmodifieddate,
    cast(hs_merged_object_ids as {{ dbt_utils.type_string() }}) as hs_merged_object_ids,
    cast(hs_created_by_user_id as {{ dbt_utils.type_float() }}) as hs_created_by_user_id,
    cast(hs_updated_by_user_id as {{ dbt_utils.type_float() }}) as hs_updated_by_user_id,
    cast(hs_unique_creation_key as {{ dbt_utils.type_string() }}) as hs_unique_creation_key,
    cast(hs_user_ids_of_all_owners as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_owners,
    cast(hs_all_accessible_team_ids as {{ dbt_utils.type_string() }}) as hs_all_accessible_team_ids,
    cast(hs_all_assigned_business_unit_ids as {{ dbt_utils.type_string() }}) as hs_all_assigned_business_unit_ids,
    cast(hs_user_ids_of_all_notification_followers as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_notification_followers,
    cast(hs_user_ids_of_all_notification_unfollowers as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_notification_unfollowers,
    _airbyte_emitted_at
from {{ ref('hubspot_forms_properties_ab1') }}
-- properties at hubspot_forms/properties

