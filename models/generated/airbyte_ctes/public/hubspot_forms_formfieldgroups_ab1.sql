{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('hubspot_forms', 'hubspot_forms', 'formfieldgroups') }}
select
    _airbyte_hubspot_forms_hashid,
    {{ json_extract_array(unnested_column_value('formfieldgroups'), ['fields']) }} as fields,
    {{ json_extract_scalar(unnested_column_value('formfieldgroups'), ['default']) }} as {{ adapter.quote('default') }},
    {{ json_extract(unnested_column_value('formfieldgroups'), ['richText']) }} as richtext,
    {{ json_extract_scalar(unnested_column_value('formfieldgroups'), ['isSmartGroup']) }} as issmartgroup,
    _airbyte_emitted_at
from {{ ref('hubspot_forms') }}
{{ cross_join_unnest('hubspot_forms', 'formfieldgroups') }}
where formfieldgroups is not null
-- formfieldgroups at hubspot_forms/formFieldGroups

