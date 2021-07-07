{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_subscription_changes', 'hubspot_subscription_changes', 'changes') }}
select
    _airbyte_hubspot_sub__iption_changes_hashid,
    {{ json_extract_scalar(unnested_column_value('changes'), ['change']) }} as change,
    {{ json_extract_scalar(unnested_column_value('changes'), ['source']) }} as {{ adapter.quote('source') }},
    {{ json_extract_scalar(unnested_column_value('changes'), ['portalId']) }} as portalid,
    {{ json_extract_scalar(unnested_column_value('changes'), ['timestamp']) }} as {{ adapter.quote('timestamp') }},
    {{ json_extract_scalar(unnested_column_value('changes'), ['changeType']) }} as changetype,
    {{ json_extract(unnested_column_value('changes'), ['causedByEvent']) }} as causedbyevent,
    {{ json_extract_scalar(unnested_column_value('changes'), ['subscriptionId']) }} as subscriptionid,
    _airbyte_emitted_at
from {{ ref('hubspot_subscription_changes') }}
{{ cross_join_unnest('hubspot_subscription_changes', 'changes') }}
where changes is not null
-- changes at hubspot_subscription_changes/changes

