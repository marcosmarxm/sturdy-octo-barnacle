{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_forms_hashid,
    fields,
    {{ adapter.quote('default') }},
    richtext,
    issmartgroup,
    _airbyte_emitted_at,
    _airbyte_formfieldgroups_hashid
from {{ ref('hubspot_forms_formfieldgroups_ab3') }}
-- formfieldgroups at hubspot_forms/formFieldGroups from {{ ref('hubspot_forms') }}

