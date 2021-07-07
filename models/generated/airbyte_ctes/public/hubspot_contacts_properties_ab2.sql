{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_contacts_hashid,
    cast(fax as {{ dbt_utils.type_string() }}) as fax,
    cast(zip as {{ dbt_utils.type_string() }}) as zip,
    cast(city as {{ dbt_utils.type_string() }}) as city,
    cast(email as {{ dbt_utils.type_string() }}) as email,
    cast(phone as {{ dbt_utils.type_string() }}) as phone,
    cast({{ adapter.quote('state') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('state') }},
    cast({{ adapter.quote('degree') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('degree') }},
    cast(gender as {{ dbt_utils.type_string() }}) as gender,
    cast(school as {{ dbt_utils.type_string() }}) as school,
    cast(address as {{ dbt_utils.type_string() }}) as address,
    cast(company as {{ dbt_utils.type_string() }}) as company,
    cast(country as {{ dbt_utils.type_string() }}) as country,
    cast(ip_city as {{ dbt_utils.type_string() }}) as ip_city,
    cast(message as {{ dbt_utils.type_string() }}) as message,
    cast(website as {{ dbt_utils.type_string() }}) as website,
    cast(industry as {{ dbt_utils.type_string() }}) as industry,
    cast(ip_state as {{ dbt_utils.type_string() }}) as ip_state,
    cast(jobtitle as {{ dbt_utils.type_string() }}) as jobtitle,
    cast(lastname as {{ dbt_utils.type_string() }}) as lastname,
    closedate,
    cast(firstname as {{ dbt_utils.type_string() }}) as firstname,
    cast(ip_latlon as {{ dbt_utils.type_string() }}) as ip_latlon,
    cast(num_notes as {{ dbt_utils.type_float() }}) as num_notes,
    cast(seniority as {{ dbt_utils.type_string() }}) as seniority,
    createdate,
    cast(hs_persona as {{ dbt_utils.type_string() }}) as hs_persona,
    cast(ip_country as {{ dbt_utils.type_string() }}) as ip_country,
    cast(ip_zipcode as {{ dbt_utils.type_string() }}) as ip_zipcode,
    cast(salutation as {{ dbt_utils.type_string() }}) as salutation,
    cast(start_date as {{ dbt_utils.type_string() }}) as start_date,
    cast(work_email as {{ dbt_utils.type_string() }}) as work_email,
    cast(hs_language as {{ dbt_utils.type_string() }}) as hs_language,
    cast(mobilephone as {{ dbt_utils.type_string() }}) as mobilephone,
    cast(company_size as {{ dbt_utils.type_string() }}) as company_size,
    cast(hs_object_id as {{ dbt_utils.type_float() }}) as hs_object_id,
    cast(hs_testpurge as {{ dbt_utils.type_string() }}) as hs_testpurge,
    cast(hubspotscore as {{ dbt_utils.type_float() }}) as hubspotscore,
    cast(job_function as {{ dbt_utils.type_string() }}) as job_function,
    cast(numemployees as {{ dbt_utils.type_string() }}) as numemployees,
    cast(annualrevenue as {{ dbt_utils.type_string() }}) as annualrevenue,
    cast(date_of_birth as {{ dbt_utils.type_string() }}) as date_of_birth,
    cast(days_to_close as {{ dbt_utils.type_float() }}) as days_to_close,
    hs_createdate,
    cast(hs_email_open as {{ dbt_utils.type_float() }}) as hs_email_open,
    hs_is_contact,
    cast(ip_state_code as {{ dbt_utils.type_string() }}) as ip_state_code,
    cast(total_revenue as {{ dbt_utils.type_float() }}) as total_revenue,
    cast(twitterhandle as {{ dbt_utils.type_string() }}) as twitterhandle,
    cast(field_of_study as {{ dbt_utils.type_string() }}) as field_of_study,
    cast(hs_buying_role as {{ dbt_utils.type_string() }}) as hs_buying_role,
    cast(hs_email_click as {{ dbt_utils.type_float() }}) as hs_email_click,
    cast(hs_ip_timezone as {{ dbt_utils.type_string() }}) as hs_ip_timezone,
    hs_is_unworked,
    cast(hs_lead_status as {{ dbt_utils.type_string() }}) as hs_lead_status,
    cast(hs_legal_basis as {{ dbt_utils.type_string() }}) as hs_legal_basis,
    cast(lifecyclestage as {{ dbt_utils.type_string() }}) as lifecyclestage,
    cast(marital_status as {{ dbt_utils.type_string() }}) as marital_status,
    cast(graduation_date as {{ dbt_utils.type_string() }}) as graduation_date,
    cast(hs_all_team_ids as {{ dbt_utils.type_string() }}) as hs_all_team_ids,
    cast(hs_email_bounce as {{ dbt_utils.type_float() }}) as hs_email_bounce,
    cast(hs_email_domain as {{ dbt_utils.type_string() }}) as hs_email_domain,
    hs_email_optout,
    cast(hs_testrollback as {{ dbt_utils.type_string() }}) as hs_testrollback,
    cast(hubspot_team_id as {{ dbt_utils.type_string() }}) as hubspot_team_id,
    cast(ip_country_code as {{ dbt_utils.type_string() }}) as ip_country_code,
    cast(military_status as {{ dbt_utils.type_string() }}) as military_status,
    cast(hs_all_owner_ids as {{ dbt_utils.type_string() }}) as hs_all_owner_ids,
    cast(hs_email_replied as {{ dbt_utils.type_float() }}) as hs_email_replied,
    cast(hubspot_owner_id as {{ dbt_utils.type_string() }}) as hubspot_owner_id,
    lastmodifieddate,
    cast(hs_count_is_worked as {{ dbt_utils.type_float() }}) as hs_count_is_worked,
    cast(hs_email_delivered as {{ dbt_utils.type_float() }}) as hs_email_delivered,
    cast(hs_google_click_id as {{ dbt_utils.type_string() }}) as hs_google_click_id,
    notes_last_updated,
    cast(recent_deal_amount as {{ dbt_utils.type_float() }}) as recent_deal_amount,
    cast(associatedcompanyid as {{ dbt_utils.type_float() }}) as associatedcompanyid,
    cast(hs_all_contact_vids as {{ dbt_utils.type_string() }}) as hs_all_contact_vids,
    cast(hs_analytics_source as {{ dbt_utils.type_string() }}) as hs_analytics_source,
    hs_lastmodifieddate,
    cast(num_contacted_notes as {{ dbt_utils.type_float() }}) as num_contacted_notes,
    cast(relationship_status as {{ dbt_utils.type_string() }}) as relationship_status,
    cast(hs_additional_emails as {{ dbt_utils.type_string() }}) as hs_additional_emails,
    cast(hs_analytics_revenue as {{ dbt_utils.type_float() }}) as hs_analytics_revenue,
    cast(hs_count_is_unworked as {{ dbt_utils.type_float() }}) as hs_count_is_unworked,
    hs_email_bad_address,
    hs_email_quarantined,
    cast(hs_facebook_click_id as {{ dbt_utils.type_string() }}) as hs_facebook_click_id,
    cast(hs_merged_object_ids as {{ dbt_utils.type_string() }}) as hs_merged_object_ids,
    notes_last_contacted,
    cast(num_associated_deals as {{ dbt_utils.type_float() }}) as num_associated_deals,
    first_conversion_date,
    cast(hs_analytics_last_url as {{ dbt_utils.type_string() }}) as hs_analytics_last_url,
    cast(hs_created_by_user_id as {{ dbt_utils.type_float() }}) as hs_created_by_user_id,
    cast(hs_updated_by_user_id as {{ dbt_utils.type_float() }}) as hs_updated_by_user_id,
    cast(num_conversion_events as {{ dbt_utils.type_float() }}) as num_conversion_events,
    cast(hs_analytics_first_url as {{ dbt_utils.type_string() }}) as hs_analytics_first_url,
    hs_email_is_ineligible,
    hs_facebook_ad_clicked,
    cast(hs_unique_creation_key as {{ dbt_utils.type_string() }}) as hs_unique_creation_key,
    recent_conversion_date,
    recent_deal_close_date,
    first_deal_created_date,
    cast(hs_analytics_num_visits as {{ dbt_utils.type_float() }}) as hs_analytics_num_visits,
    hs_email_last_open_date,
    hs_email_last_send_date,
    cast(webinareventlastupdated as {{ dbt_utils.type_float() }}) as webinareventlastupdated,
    hs_email_first_open_date,
    hs_email_first_send_date,
    hs_email_last_click_date,
    cast(hs_email_last_email_name as {{ dbt_utils.type_string() }}) as hs_email_last_email_name,
    hs_email_last_reply_date,
    cast(hs_email_optout_10798197 as {{ dbt_utils.type_string() }}) as hs_email_optout_10798197,
    cast(hs_email_optout_11890603 as {{ dbt_utils.type_string() }}) as hs_email_optout_11890603,
    cast(hs_email_optout_11890831 as {{ dbt_utils.type_string() }}) as hs_email_optout_11890831,
    hs_sequences_is_enrolled,
    notes_next_activity_date,
    cast(hs_avatar_filemanager_key as {{ dbt_utils.type_string() }}) as hs_avatar_filemanager_key,
    cast(hs_calculated_merged_vids as {{ dbt_utils.type_string() }}) as hs_calculated_merged_vids,
    hs_email_first_click_date,
    hs_email_first_reply_date,
    cast(hs_user_ids_of_all_owners as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_owners,
    cast(hs_all_accessible_team_ids as {{ dbt_utils.type_string() }}) as hs_all_accessible_team_ids,
    cast(hs_analytics_last_referrer as {{ dbt_utils.type_string() }}) as hs_analytics_last_referrer,
    cast(hs_analytics_source_data_1 as {{ dbt_utils.type_string() }}) as hs_analytics_source_data_1,
    cast(hs_analytics_source_data_2 as {{ dbt_utils.type_string() }}) as hs_analytics_source_data_2,
    cast(hs_calculated_phone_number as {{ dbt_utils.type_string() }}) as hs_calculated_phone_number,
    hs_document_last_revisited,
    cast(hs_emailconfirmationstatus as {{ dbt_utils.type_string() }}) as hs_emailconfirmationstatus,
    hs_latest_meeting_activity,
    hs_sales_email_last_opened,
    hubspot_owner_assigneddate,
    cast(first_conversion_event_name as {{ dbt_utils.type_string() }}) as first_conversion_event_name,
    cast(hs_analytics_first_referrer as {{ dbt_utils.type_string() }}) as hs_analytics_first_referrer,
    hs_analytics_last_timestamp,
    cast(hs_analytics_num_page_views as {{ dbt_utils.type_float() }}) as hs_analytics_num_page_views,
    cast(hs_calculated_mobile_number as {{ dbt_utils.type_string() }}) as hs_calculated_mobile_number,
    cast(hs_content_membership_notes as {{ dbt_utils.type_string() }}) as hs_content_membership_notes,
    hs_created_by_conversations,
    cast(hs_email_hard_bounce_reason as {{ dbt_utils.type_string() }}) as hs_email_hard_bounce_reason,
    cast(hs_email_quarantined_reason as {{ dbt_utils.type_string() }}) as hs_email_quarantined_reason,
    hs_last_sales_activity_date,
    cast(hs_latest_sequence_enrolled as {{ dbt_utils.type_float() }}) as hs_latest_sequence_enrolled,
    hs_lifecyclestage_lead_date,
    hs_sa_first_engagement_date,
    hs_sales_email_last_clicked,
    hs_sales_email_last_replied,
    cast(hs_sequences_enrolled_count as {{ dbt_utils.type_float() }}) as hs_sequences_enrolled_count,
    cast(hs_time_to_first_engagement as {{ dbt_utils.type_float() }}) as hs_time_to_first_engagement,
    cast(associatedcompanylastupdated as {{ dbt_utils.type_float() }}) as associatedcompanylastupdated,
    hs_analytics_first_timestamp,
    cast(hs_content_membership_status as {{ dbt_utils.type_string() }}) as hs_content_membership_status,
    hs_lifecyclestage_other_date,
    cast(hs_sa_first_engagement_descr as {{ dbt_utils.type_string() }}) as hs_sa_first_engagement_descr,
    cast(num_unique_conversion_events as {{ dbt_utils.type_float() }}) as num_unique_conversion_events,
    cast(recent_conversion_event_name as {{ dbt_utils.type_string() }}) as recent_conversion_event_name,
    cast(surveymonkeyeventlastupdated as {{ dbt_utils.type_float() }}) as surveymonkeyeventlastupdated,
    cast(hs_first_engagement_object_id as {{ dbt_utils.type_float() }}) as hs_first_engagement_object_id,
    hs_latest_sequence_ended_date,
    cast(hs_calculated_form_submissions as {{ dbt_utils.type_string() }}) as hs_calculated_form_submissions,
    cast(hs_conversations_visitor_email as {{ dbt_utils.type_string() }}) as hs_conversations_visitor_email,
    engagements_last_meeting_booked,
    cast(hs_analytics_average_page_views as {{ dbt_utils.type_float() }}) as hs_analytics_average_page_views,
    hs_lifecyclestage_customer_date,
    cast(hs_email_hard_bounce_reason_enum as {{ dbt_utils.type_string() }}) as hs_email_hard_bounce_reason_enum,
    hs_last_sales_activity_timestamp,
    hs_latest_sequence_enrolled_date,
    hs_latest_sequence_finished_date,
    hs_analytics_last_visit_timestamp,
    hs_lifecyclestage_evangelist_date,
    hs_lifecyclestage_subscriber_date,
    hs_analytics_first_visit_timestamp,
    cast(hs_analytics_num_event_completions as {{ dbt_utils.type_float() }}) as hs_analytics_num_event_completions,
    hs_latest_sequence_unenrolled_date,
    hs_lifecyclestage_opportunity_date,
    cast(hs_sa_first_engagement_object_type as {{ dbt_utils.type_string() }}) as hs_sa_first_engagement_object_type,
    hs_content_membership_registered_at,
    cast(hs_calculated_phone_number_area_code as {{ dbt_utils.type_string() }}) as hs_calculated_phone_number_area_code,
    cast(hs_email_customer_quarantined_reason as {{ dbt_utils.type_string() }}) as hs_email_customer_quarantined_reason,
    cast(hs_email_sends_since_last_engagement as {{ dbt_utils.type_float() }}) as hs_email_sends_since_last_engagement,
    hs_content_membership_email_confirmed,
    cast(hs_searchable_calculated_phone_number as {{ dbt_utils.type_float() }}) as hs_searchable_calculated_phone_number,
    cast(engagements_last_meeting_booked_medium as {{ dbt_utils.type_string() }}) as engagements_last_meeting_booked_medium,
    cast(engagements_last_meeting_booked_source as {{ dbt_utils.type_string() }}) as engagements_last_meeting_booked_source,
    cast(hs_calculated_phone_number_region_code as {{ dbt_utils.type_string() }}) as hs_calculated_phone_number_region_code,
    cast(hs_searchable_calculated_mobile_number as {{ dbt_utils.type_float() }}) as hs_searchable_calculated_mobile_number,
    cast(hs_calculated_phone_number_country_code as {{ dbt_utils.type_string() }}) as hs_calculated_phone_number_country_code,
    cast(engagements_last_meeting_booked_campaign as {{ dbt_utils.type_string() }}) as engagements_last_meeting_booked_campaign,
    hs_lifecyclestage_salesqualifiedlead_date,
    cast(hs_user_ids_of_all_notification_followers as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_notification_followers,
    cast(hs_analytics_last_touch_converting_campaign as {{ dbt_utils.type_string() }}) as hs_analytics_last_touch_converting_campaign,
    cast(hs_user_ids_of_all_notification_unfollowers as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_notification_unfollowers,
    cast(hs_analytics_first_t__h_converting_campaign as {{ dbt_utils.type_string() }}) as hs_analytics_first_t__h_converting_campaign,
    hs_lifecyclestage_ma__ingqualifiedlead_date,
    hs_content_membershi__tration_email_sent_at,
    cast(hs_content_membershi__ration_domain_sent_to as {{ dbt_utils.type_string() }}) as hs_content_membershi__ration_domain_sent_to,
    cast(hs_searchable_calcul__national_phone_number as {{ dbt_utils.type_float() }}) as hs_searchable_calcul__national_phone_number,
    cast(hs_searchable_calcul__ational_mobile_number as {{ dbt_utils.type_float() }}) as hs_searchable_calcul__ational_mobile_number,
    _airbyte_emitted_at
from {{ ref('hubspot_contacts_properties_ab1') }}
-- properties at hubspot_contacts/properties

