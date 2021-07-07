{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_analytic__y_sum_e46e85b0_hashid
from {{ ref('hubspot_contacts_ass__dinality_sum_e46e85b0_ab3') }}
-- hs_analytics_num_pag__dinality_sum_e46e85b0 at hubspot_contacts/associated-company/properties/hs_analytics_num_page_views_cardinality_sum_e46e85b0 from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

