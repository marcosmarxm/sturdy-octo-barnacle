{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_contacts_hashid',
        'vid',
        boolean_to_string(adapter.quote('is-member')),
        adapter.quote('timestamp'),
        adapter.quote('static-list-id'),
        adapter.quote('internal-list-id'),
    ]) }} as _airbyte_list_memberships_hashid
from {{ ref('hubspot_contacts_list_memberships_ab2') }}
-- list_memberships at hubspot_contacts/list-memberships

