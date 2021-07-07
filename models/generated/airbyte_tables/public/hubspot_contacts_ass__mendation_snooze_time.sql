{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_target_a__on_snooze_time_hashid
from {{ ref('hubspot_contacts_ass__mendation_snooze_time_ab3') }}
-- hs_target_account_re__mendation_snooze_time at hubspot_contacts/associated-company/properties/hs_target_account_recommendation_snooze_time from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

