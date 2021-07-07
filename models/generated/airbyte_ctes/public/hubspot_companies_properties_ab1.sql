{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_hubspot_companies_hashid,
    {{ json_extract_scalar('properties', ['zip']) }} as zip,
    {{ json_extract_scalar('properties', ['city']) }} as city,
    {{ json_extract_scalar('properties', ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('properties', ['type']) }} as {{ adapter.quote('type') }},
    {{ json_extract_scalar('properties', ['phone']) }} as phone,
    {{ json_extract_scalar('properties', ['state']) }} as {{ adapter.quote('state') }},
    {{ json_extract_scalar('properties', ['domain']) }} as {{ adapter.quote('domain') }},
    {{ json_extract_scalar('properties', ['address']) }} as address,
    {{ json_extract_scalar('properties', ['country']) }} as country,
    {{ json_extract_scalar('properties', ['website']) }} as website,
    {{ json_extract_scalar('properties', ['about_us']) }} as about_us,
    {{ json_extract_scalar('properties', ['address2']) }} as address2,
    {{ json_extract_scalar('properties', ['industry']) }} as industry,
    {{ json_extract_scalar('properties', ['timezone']) }} as timezone,
    {{ json_extract('properties', ['closedate']) }} as closedate,
    {{ json_extract('properties', ['is_public']) }} as is_public,
    {{ json_extract_scalar('properties', ['num_notes']) }} as num_notes,
    {{ json_extract('properties', ['createdate']) }} as createdate,
    {{ json_extract_scalar('properties', ['twitterbio']) }} as twitterbio,
    {{ json_extract_scalar('properties', ['description']) }} as description,
    {{ json_extract_scalar('properties', ['linkedinbio']) }} as linkedinbio,
    {{ json_extract_scalar('properties', ['facebookfans']) }} as facebookfans,
    {{ json_extract_scalar('properties', ['founded_year']) }} as founded_year,
    {{ json_extract_scalar('properties', ['hs_object_id']) }} as hs_object_id,
    {{ json_extract_scalar('properties', ['annualrevenue']) }} as annualrevenue,
    {{ json_extract_scalar('properties', ['days_to_close']) }} as days_to_close,
    {{ json_extract('properties', ['hs_createdate']) }} as hs_createdate,
    {{ json_extract_scalar('properties', ['total_revenue']) }} as total_revenue,
    {{ json_extract_scalar('properties', ['twitterhandle']) }} as twitterhandle,
    {{ json_extract_scalar('properties', ['hs_lead_status']) }} as hs_lead_status,
    {{ json_extract_scalar('properties', ['lifecyclestage']) }} as lifecyclestage,
    {{ json_extract_scalar('properties', ['googleplus_page']) }} as googleplus_page,
    {{ json_extract_scalar('properties', ['hs_all_team_ids']) }} as hs_all_team_ids,
    {{ json_extract_scalar('properties', ['hs_num_blockers']) }} as hs_num_blockers,
    {{ json_extract_scalar('properties', ['hubspot_team_id']) }} as hubspot_team_id,
    {{ json_extract_scalar('properties', ['hs_all_owner_ids']) }} as hs_all_owner_ids,
    {{ json_extract_scalar('properties', ['hubspot_owner_id']) }} as hubspot_owner_id,
    {{ json_extract_scalar('properties', ['twitterfollowers']) }} as twitterfollowers,
    {{ json_extract_scalar('properties', ['web_technologies']) }} as web_technologies,
    {{ json_extract_scalar('properties', ['hs_num_open_deals']) }} as hs_num_open_deals,
    {{ json_extract_scalar('properties', ['hs_target_account']) }} as hs_target_account,
    {{ json_extract_scalar('properties', ['numberofemployees']) }} as numberofemployees,
    {{ json_extract('properties', ['notes_last_updated']) }} as notes_last_updated,
    {{ json_extract_scalar('properties', ['recent_deal_amount']) }} as recent_deal_amount,
    {{ json_extract_scalar('properties', ['total_money_raised']) }} as total_money_raised,
    {{ json_extract_scalar('properties', ['hs_analytics_source']) }} as hs_analytics_source,
    {{ json_extract('properties', ['hs_lastmodifieddate']) }} as hs_lastmodifieddate,
    {{ json_extract_scalar('properties', ['hs_total_deal_value']) }} as hs_total_deal_value,
    {{ json_extract_scalar('properties', ['num_contacted_notes']) }} as num_contacted_notes,
    {{ json_extract('properties', ['hs_is_target_account']) }} as hs_is_target_account,
    {{ json_extract_scalar('properties', ['hs_merged_object_ids']) }} as hs_merged_object_ids,
    {{ json_extract_scalar('properties', ['hs_parent_company_id']) }} as hs_parent_company_id,
    {{ json_extract('properties', ['notes_last_contacted']) }} as notes_last_contacted,
    {{ json_extract_scalar('properties', ['num_associated_deals']) }} as num_associated_deals,
    {{ json_extract_scalar('properties', ['facebook_company_page']) }} as facebook_company_page,
    {{ json_extract_scalar('properties', ['hs_additional_domains']) }} as hs_additional_domains,
    {{ json_extract_scalar('properties', ['hs_created_by_user_id']) }} as hs_created_by_user_id,
    {{ json_extract_scalar('properties', ['hs_updated_by_user_id']) }} as hs_updated_by_user_id,
    {{ json_extract_scalar('properties', ['linkedin_company_page']) }} as linkedin_company_page,
    {{ json_extract('properties', ['hs_last_open_task_date']) }} as hs_last_open_task_date,
    {{ json_extract_scalar('properties', ['hs_num_child_companies']) }} as hs_num_child_companies,
    {{ json_extract_scalar('properties', ['hs_num_decision_makers']) }} as hs_num_decision_makers,
    {{ json_extract_scalar('properties', ['hs_unique_creation_key']) }} as hs_unique_creation_key,
    {{ json_extract('properties', ['recent_deal_close_date']) }} as recent_deal_close_date,
    {{ json_extract('properties', ['first_deal_created_date']) }} as first_deal_created_date,
    {{ json_extract_scalar('properties', ['hs_analytics_num_visits']) }} as hs_analytics_num_visits,
    {{ json_extract_scalar('properties', ['num_associated_contacts']) }} as num_associated_contacts,
    {{ json_extract('properties', ['first_contact_createdate']) }} as first_contact_createdate,
    {{ json_extract('properties', ['hs_last_logged_call_date']) }} as hs_last_logged_call_date,
    {{ json_extract('properties', ['notes_next_activity_date']) }} as notes_next_activity_date,
    {{ json_extract_scalar('properties', ['hs_avatar_filemanager_key']) }} as hs_avatar_filemanager_key,
    {{ json_extract_scalar('properties', ['hs_ideal_customer_profile']) }} as hs_ideal_customer_profile,
    {{ json_extract_scalar('properties', ['hs_user_ids_of_all_owners']) }} as hs_user_ids_of_all_owners,
    {{ json_extract_scalar('properties', ['hs_all_accessible_team_ids']) }} as hs_all_accessible_team_ids,
    {{ json_extract_scalar('properties', ['hs_analytics_source_data_1']) }} as hs_analytics_source_data_1,
    {{ json_extract_scalar('properties', ['hs_analytics_source_data_2']) }} as hs_analytics_source_data_2,
    {{ json_extract('properties', ['hs_latest_meeting_activity']) }} as hs_latest_meeting_activity,
    {{ json_extract('properties', ['hubspot_owner_assigneddate']) }} as hubspot_owner_assigneddate,
    {{ json_extract('properties', ['hs_analytics_last_timestamp']) }} as hs_analytics_last_timestamp,
    {{ json_extract_scalar('properties', ['hs_analytics_num_page_views']) }} as hs_analytics_num_page_views,
    {{ json_extract('properties', ['hs_last_booked_meeting_date']) }} as hs_last_booked_meeting_date,
    {{ json_extract('properties', ['hs_last_sales_activity_date']) }} as hs_last_sales_activity_date,
    {{ json_extract('properties', ['hs_sales_email_last_replied']) }} as hs_sales_email_last_replied,
    {{ json_extract('properties', ['hs_analytics_first_timestamp']) }} as hs_analytics_first_timestamp,
    {{ json_extract_scalar('properties', ['hs_target_account_probability']) }} as hs_target_account_probability,
    {{ json_extract('properties', ['engagements_last_meeting_booked']) }} as engagements_last_meeting_booked,
    {{ json_extract('properties', ['hs_last_sales_activity_timestamp']) }} as hs_last_sales_activity_timestamp,
    {{ json_extract_scalar('properties', ['hs_all_assigned_business_unit_ids']) }} as hs_all_assigned_business_unit_ids,
    {{ json_extract('properties', ['hs_analytics_last_visit_timestamp']) }} as hs_analytics_last_visit_timestamp,
    {{ json_extract_scalar('properties', ['hs_num_contacts_with_buying_roles']) }} as hs_num_contacts_with_buying_roles,
    {{ json_extract('properties', ['hs_analytics_first_visit_timestamp']) }} as hs_analytics_first_visit_timestamp,
    {{ json_extract_scalar('properties', ['engagements_last_meeting_booked_medium']) }} as engagements_last_meeting_booked_medium,
    {{ json_extract_scalar('properties', ['engagements_last_meeting_booked_source']) }} as engagements_last_meeting_booked_source,
    {{ json_extract_scalar('properties', ['hs_target_account_recommendation_state']) }} as hs_target_account_recommendation_state,
    {{ json_extract_scalar('properties', ['engagements_last_meeting_booked_campaign']) }} as engagements_last_meeting_booked_campaign,
    {{ json_extract_scalar('properties', ['hs_user_ids_of_all_notification_followers']) }} as hs_user_ids_of_all_notification_followers,
    {{ json_extract('properties', ['closedate_timestamp_earliest_value_a2a17e6e']) }} as closedate_timestamp_earliest_value_a2a17e6e,
    {{ json_extract_scalar('properties', ['hs_analytics_last_touch_converting_campaign']) }} as hs_analytics_last_touch_converting_campaign,
    {{ json_extract_scalar('properties', ['hs_user_ids_of_all_notification_unfollowers']) }} as hs_user_ids_of_all_notification_unfollowers,
    {{ json_extract_scalar('properties', ['hs_analytics_first_touch_converting_campaign']) }} as hs_analytics_first_t__h_converting_campaign,
    {{ json_extract('properties', ['hs_target_account_recommendation_snooze_time']) }} as hs_target_account_re__mendation_snooze_time,
    {{ json_extract_scalar('properties', ['num_conversion_events_cardinality_sum_d095f14b']) }} as num_conversion_event__dinality_sum_d095f14b,
    {{ json_extract_scalar('properties', ['hs_analytics_num_visits_cardinality_sum_53d952a6']) }} as hs_analytics_num_vis__dinality_sum_53d952a6,
    {{ json_extract_scalar('properties', ['hs_predictivecontactscore_v2_next_max_max_d4e58c1e']) }} as hs_predictivecontact__next_max_max_d4e58c1e,
    {{ json_extract_scalar('properties', ['hs_analytics_num_page_views_cardinality_sum_e46e85b0']) }} as hs_analytics_num_pag__dinality_sum_e46e85b0,
    {{ json_extract('properties', ['hs_analytics_source_timestamp_earliest_value_25a3a52c']) }} as hs_analytics_source___rliest_value_25a3a52c,
    {{ json_extract('properties', ['recent_conversion_date_timestamp_latest_value_72856da1']) }} as recent_conversion_da__latest_value_72856da1,
    {{ json_extract('properties', ['first_conversion_date_timestamp_earliest_value_61f58f2c']) }} as first_conversion_dat__rliest_value_61f58f2c,
    {{ json_extract('properties', ['first_contact_createdate_timestamp_earliest_value_78b50eea']) }} as first_contact_create__rliest_value_78b50eea,
    {{ json_extract('properties', ['hs_analytics_last_timestamp_timestamp_latest_value_4e16365a']) }} as hs_analytics_last_ti__latest_value_4e16365a,
    {{ json_extract('properties', ['hs_analytics_source_data_1_timestamp_earliest_value_9b2f1fa1']) }} as hs_analytics_source___rliest_value_9b2f1fa1,
    {{ json_extract('properties', ['hs_analytics_source_data_2_timestamp_earliest_value_9b2f9400']) }} as hs_analytics_source___rliest_value_9b2f9400,
    {{ json_extract('properties', ['recent_conversion_event_name_timestamp_latest_value_66c820bf']) }} as recent_conversion_ev__latest_value_66c820bf,
    {{ json_extract('properties', ['first_conversion_event_name_timestamp_earliest_value_68ddae0a']) }} as first_conversion_eve__rliest_value_68ddae0a,
    {{ json_extract('properties', ['hs_analytics_first_timestamp_timestamp_earliest_value_11e3a63a']) }} as hs_analytics_first_t__rliest_value_11e3a63a,
    {{ json_extract('properties', ['hs_analytics_last_visit_timestamp_timestamp_latest_value_999a0fce']) }} as hs_analytics_last_vi__latest_value_999a0fce,
    {{ json_extract('properties', ['hs_analytics_first_visit_timestamp_timestamp_earliest_value_accc17ae']) }} as hs_analytics_first_v__rliest_value_accc17ae,
    {{ json_extract('properties', ['hs_analytics_last_touch_converting_campaign_timestamp_latest_value_81a64e30']) }} as hs_analytics_last_to__latest_value_81a64e30,
    {{ json_extract('properties', ['hs_analytics_first_touch_converting_campaign_timestamp_earliest_value_4757fe10']) }} as hs_analytics_first_t__rliest_value_4757fe10,
    _airbyte_emitted_at
from {{ ref('hubspot_companies') }}
where properties is not null
-- properties at hubspot_companies/properties
