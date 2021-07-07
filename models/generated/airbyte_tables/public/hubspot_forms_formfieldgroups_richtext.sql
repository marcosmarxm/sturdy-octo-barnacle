{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_formfieldgroups_hashid,
    {{ adapter.quote('content') }},
    _airbyte_emitted_at,
    _airbyte_richtext_hashid
from {{ ref('hubspot_forms_formfieldgroups_richtext_ab3') }}
-- richtext at hubspot_forms/formFieldGroups/richText from {{ ref('hubspot_forms_formfieldgroups') }}

