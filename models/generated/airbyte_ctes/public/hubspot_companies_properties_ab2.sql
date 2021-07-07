{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_companies_hashid,
    cast(zip as {{ dbt_utils.type_string() }}) as zip,
    cast(city as {{ dbt_utils.type_string() }}) as city,
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast({{ adapter.quote('type') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('type') }},
    cast(phone as {{ dbt_utils.type_string() }}) as phone,
    cast({{ adapter.quote('state') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('state') }},
    cast({{ adapter.quote('domain') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('domain') }},
    cast(address as {{ dbt_utils.type_string() }}) as address,
    cast(country as {{ dbt_utils.type_string() }}) as country,
    cast(website as {{ dbt_utils.type_string() }}) as website,
    cast(about_us as {{ dbt_utils.type_string() }}) as about_us,
    cast(address2 as {{ dbt_utils.type_string() }}) as address2,
    cast(industry as {{ dbt_utils.type_string() }}) as industry,
    cast(timezone as {{ dbt_utils.type_string() }}) as timezone,
    closedate,
    is_public,
    cast(num_notes as {{ dbt_utils.type_float() }}) as num_notes,
    createdate,
    cast(twitterbio as {{ dbt_utils.type_string() }}) as twitterbio,
    cast(description as {{ dbt_utils.type_string() }}) as description,
    cast(linkedinbio as {{ dbt_utils.type_string() }}) as linkedinbio,
    cast(facebookfans as {{ dbt_utils.type_float() }}) as facebookfans,
    cast(founded_year as {{ dbt_utils.type_string() }}) as founded_year,
    cast(hs_object_id as {{ dbt_utils.type_float() }}) as hs_object_id,
    cast(annualrevenue as {{ dbt_utils.type_float() }}) as annualrevenue,
    cast(days_to_close as {{ dbt_utils.type_float() }}) as days_to_close,
    hs_createdate,
    cast(total_revenue as {{ dbt_utils.type_float() }}) as total_revenue,
    cast(twitterhandle as {{ dbt_utils.type_string() }}) as twitterhandle,
    cast(hs_lead_status as {{ dbt_utils.type_string() }}) as hs_lead_status,
    cast(lifecyclestage as {{ dbt_utils.type_string() }}) as lifecyclestage,
    cast(googleplus_page as {{ dbt_utils.type_string() }}) as googleplus_page,
    cast(hs_all_team_ids as {{ dbt_utils.type_string() }}) as hs_all_team_ids,
    cast(hs_num_blockers as {{ dbt_utils.type_float() }}) as hs_num_blockers,
    cast(hubspot_team_id as {{ dbt_utils.type_string() }}) as hubspot_team_id,
    cast(hs_all_owner_ids as {{ dbt_utils.type_string() }}) as hs_all_owner_ids,
    cast(hubspot_owner_id as {{ dbt_utils.type_string() }}) as hubspot_owner_id,
    cast(twitterfollowers as {{ dbt_utils.type_float() }}) as twitterfollowers,
    cast(web_technologies as {{ dbt_utils.type_string() }}) as web_technologies,
    cast(hs_num_open_deals as {{ dbt_utils.type_float() }}) as hs_num_open_deals,
    cast(hs_target_account as {{ dbt_utils.type_string() }}) as hs_target_account,
    cast(numberofemployees as {{ dbt_utils.type_float() }}) as numberofemployees,
    notes_last_updated,
    cast(recent_deal_amount as {{ dbt_utils.type_float() }}) as recent_deal_amount,
    cast(total_money_raised as {{ dbt_utils.type_string() }}) as total_money_raised,
    cast(hs_analytics_source as {{ dbt_utils.type_string() }}) as hs_analytics_source,
    hs_lastmodifieddate,
    cast(hs_total_deal_value as {{ dbt_utils.type_float() }}) as hs_total_deal_value,
    cast(num_contacted_notes as {{ dbt_utils.type_float() }}) as num_contacted_notes,
    hs_is_target_account,
    cast(hs_merged_object_ids as {{ dbt_utils.type_string() }}) as hs_merged_object_ids,
    cast(hs_parent_company_id as {{ dbt_utils.type_float() }}) as hs_parent_company_id,
    notes_last_contacted,
    cast(num_associated_deals as {{ dbt_utils.type_float() }}) as num_associated_deals,
    cast(facebook_company_page as {{ dbt_utils.type_string() }}) as facebook_company_page,
    cast(hs_additional_domains as {{ dbt_utils.type_string() }}) as hs_additional_domains,
    cast(hs_created_by_user_id as {{ dbt_utils.type_float() }}) as hs_created_by_user_id,
    cast(hs_updated_by_user_id as {{ dbt_utils.type_float() }}) as hs_updated_by_user_id,
    cast(linkedin_company_page as {{ dbt_utils.type_string() }}) as linkedin_company_page,
    hs_last_open_task_date,
    cast(hs_num_child_companies as {{ dbt_utils.type_float() }}) as hs_num_child_companies,
    cast(hs_num_decision_makers as {{ dbt_utils.type_float() }}) as hs_num_decision_makers,
    cast(hs_unique_creation_key as {{ dbt_utils.type_string() }}) as hs_unique_creation_key,
    recent_deal_close_date,
    first_deal_created_date,
    cast(hs_analytics_num_visits as {{ dbt_utils.type_float() }}) as hs_analytics_num_visits,
    cast(num_associated_contacts as {{ dbt_utils.type_float() }}) as num_associated_contacts,
    first_contact_createdate,
    hs_last_logged_call_date,
    notes_next_activity_date,
    cast(hs_avatar_filemanager_key as {{ dbt_utils.type_string() }}) as hs_avatar_filemanager_key,
    cast(hs_ideal_customer_profile as {{ dbt_utils.type_string() }}) as hs_ideal_customer_profile,
    cast(hs_user_ids_of_all_owners as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_owners,
    cast(hs_all_accessible_team_ids as {{ dbt_utils.type_string() }}) as hs_all_accessible_team_ids,
    cast(hs_analytics_source_data_1 as {{ dbt_utils.type_string() }}) as hs_analytics_source_data_1,
    cast(hs_analytics_source_data_2 as {{ dbt_utils.type_string() }}) as hs_analytics_source_data_2,
    hs_latest_meeting_activity,
    hubspot_owner_assigneddate,
    hs_analytics_last_timestamp,
    cast(hs_analytics_num_page_views as {{ dbt_utils.type_float() }}) as hs_analytics_num_page_views,
    hs_last_booked_meeting_date,
    hs_last_sales_activity_date,
    hs_sales_email_last_replied,
    hs_analytics_first_timestamp,
    cast(hs_target_account_probability as {{ dbt_utils.type_float() }}) as hs_target_account_probability,
    engagements_last_meeting_booked,
    hs_last_sales_activity_timestamp,
    cast(hs_all_assigned_business_unit_ids as {{ dbt_utils.type_string() }}) as hs_all_assigned_business_unit_ids,
    hs_analytics_last_visit_timestamp,
    cast(hs_num_contacts_with_buying_roles as {{ dbt_utils.type_float() }}) as hs_num_contacts_with_buying_roles,
    hs_analytics_first_visit_timestamp,
    cast(engagements_last_meeting_booked_medium as {{ dbt_utils.type_string() }}) as engagements_last_meeting_booked_medium,
    cast(engagements_last_meeting_booked_source as {{ dbt_utils.type_string() }}) as engagements_last_meeting_booked_source,
    cast(hs_target_account_recommendation_state as {{ dbt_utils.type_string() }}) as hs_target_account_recommendation_state,
    cast(engagements_last_meeting_booked_campaign as {{ dbt_utils.type_string() }}) as engagements_last_meeting_booked_campaign,
    cast(hs_user_ids_of_all_notification_followers as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_notification_followers,
    closedate_timestamp_earliest_value_a2a17e6e,
    cast(hs_analytics_last_touch_converting_campaign as {{ dbt_utils.type_string() }}) as hs_analytics_last_touch_converting_campaign,
    cast(hs_user_ids_of_all_notification_unfollowers as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_notification_unfollowers,
    cast(hs_analytics_first_t__h_converting_campaign as {{ dbt_utils.type_string() }}) as hs_analytics_first_t__h_converting_campaign,
    hs_target_account_re__mendation_snooze_time,
    cast(num_conversion_event__dinality_sum_d095f14b as {{ dbt_utils.type_float() }}) as num_conversion_event__dinality_sum_d095f14b,
    cast(hs_analytics_num_vis__dinality_sum_53d952a6 as {{ dbt_utils.type_float() }}) as hs_analytics_num_vis__dinality_sum_53d952a6,
    cast(hs_predictivecontact__next_max_max_d4e58c1e as {{ dbt_utils.type_float() }}) as hs_predictivecontact__next_max_max_d4e58c1e,
    cast(hs_analytics_num_pag__dinality_sum_e46e85b0 as {{ dbt_utils.type_float() }}) as hs_analytics_num_pag__dinality_sum_e46e85b0,
    hs_analytics_source___rliest_value_25a3a52c,
    recent_conversion_da__latest_value_72856da1,
    first_conversion_dat__rliest_value_61f58f2c,
    first_contact_create__rliest_value_78b50eea,
    hs_analytics_last_ti__latest_value_4e16365a,
    hs_analytics_source___rliest_value_9b2f1fa1,
    hs_analytics_source___rliest_value_9b2f9400,
    recent_conversion_ev__latest_value_66c820bf,
    first_conversion_eve__rliest_value_68ddae0a,
    hs_analytics_first_t__rliest_value_11e3a63a,
    hs_analytics_last_vi__latest_value_999a0fce,
    hs_analytics_first_v__rliest_value_accc17ae,
    hs_analytics_last_to__latest_value_81a64e30,
    hs_analytics_first_t__rliest_value_4757fe10,
    _airbyte_emitted_at
from {{ ref('hubspot_companies_properties_ab1') }}
-- properties at hubspot_companies/properties
