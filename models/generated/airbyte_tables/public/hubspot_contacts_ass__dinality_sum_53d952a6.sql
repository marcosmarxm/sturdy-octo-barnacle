{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytic__y_sum_53d952a6_hashid
from {{ ref('hubspot_contacts_ass__dinality_sum_53d952a6_ab3') }}
-- hs_analytics_num_vis__dinality_sum_53d952a6 at hubspot_contacts/associated-company/properties/hs_analytics_num_visits_cardinality_sum_53d952a6 from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

