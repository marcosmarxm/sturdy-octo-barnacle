{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_properties_hashid,
    {{ adapter.quote('value') }},
    {{ adapter.quote('source') }},
    sourceid,
    {{ adapter.quote('timestamp') }},
    _airbyte_emitted_at,
    _airbyte_hs_sales_email_last_replied_hashid
from {{ ref('hubspot_contacts_ass__es_email_last_replied_ab3') }}
-- hs_sales_email_last_replied at hubspot_contacts/associated-company/properties/hs_sales_email_last_replied from {{ ref('hubspot_contacts_ass__ed_company_properties') }}

