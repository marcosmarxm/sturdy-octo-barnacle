{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_hubspot_engagements_hashid,
    hs_call_body,
    hs_i_cal_uid,
    hs_note_body,
    hs_object_id,
    hs_task_body,
    hs_task_type,
    hs_timestamp,
    hs_unique_id,
    hs_call_title,
    hs_created_by,
    hs_createdate,
    hs_email_html,
    hs_email_text,
    hs_call_app_id,
    hs_call_source,
    hs_call_status,
    hs_modified_by,
    hs_task_status,
    hs_all_team_ids,
    hs_body_preview,
    hs_email_cc_raw,
    hs_email_status,
    hs_email_to_raw,
    hs_gdpr_deleted,
    hs_meeting_body,
    hs_product_name,
    hs_task_subject,
    hubspot_team_id,
    hs_activity_type,
    hs_all_owner_ids,
    hs_call_duration,
    hs_email_bcc_raw,
    hs_email_headers,
    hs_email_subject,
    hs_meeting_title,
    hs_task_priority,
    hubspot_owner_id,
    hs_attachment_ids,
    hs_call_to_number,
    hs_email_cc_email,
    hs_email_from_raw,
    hs_email_sent_via,
    hs_email_to_email,
    hs_meeting_source,
    hs_task_reminders,
    hs_email_bcc_email,
    hs_email_direction,
    hs_email_thread_id,
    hs_engagement_type,
    hs_meeting_outcome,
    hs_scheduled_tasks,
    hs_task_is_all_day,
    hs_call_disposition,
    hs_call_external_id,
    hs_call_from_number,
    hs_email_from_email,
    hs_email_message_id,
    hs_email_sender_raw,
    hs_follow_up_action,
    hs_lastmodifieddate,
    hs_meeting_end_time,
    hs_meeting_location,
    hs_task_template_id,
    hs_body_preview_html,
    hs_calendar_event_id,
    hs_email_cc_lastname,
    hs_email_logged_from,
    hs_email_to_lastname,
    hs_email_tracker_key,
    hs_engagement_source,
    hs_meeting_source_id,
    hs_merged_object_ids,
    hs_call_recording_url,
    hs_created_by_user_id,
    hs_email_bcc_lastname,
    hs_email_cc_firstname,
    hs_email_sender_email,
    hs_email_to_firstname,
    hs_meeting_start_time,
    hs_updated_by_user_id,
    hs_call_has_transcript,
    hs_email_bcc_firstname,
    hs_email_error_message,
    hs_email_from_lastname,
    hs_email_send_event_id,
    hs_unique_creation_key,
    hs_email_from_firstname,
    hs_engagement_source_id,
    hs_meeting_external_url,
    hs_num_associated_deals,
    hs_publishing_task_body,
    hs_publishing_task_name,
    hs_queue_membership_ids,
    hs_task_completion_date,
    hs_task_for_object_type,
    hs_task_repeat_interval,
    hs_call_callee_object_id,
    hs_call_transcription_id,
    hs_calls_service_call_id,
    hs_email_sender_lastname,
    hs_publishing_task_state,
    hs_at_mentioned_owner_ids,
    hs_call_zoom_meeting_uuid,
    hs_email_post_send_status,
    hs_email_sender_firstname,
    hs_internal_meeting_notes,
    hs_num_associated_tickets,
    hs_user_ids_of_all_owners,
    hs_all_accessible_team_ids,
    hs_call_callee_object_type,
    hs_direction_and_unique_id,
    hs_email_facsimile_send_id,
    hs_num_associated_contacts,
    hs_task_relative_reminders,
    hubspot_owner_assigneddate,
    hs_call_authed_url_provider,
    hs_call_external_account_id,
    hs_call_video_recording_url,
    hs_conversation_session_url,
    hs_email_validation_skipped,
    hs_num_associated_companies,
    hs_publishing_task_category,
    hs_task_sequence_step_order,
    hs_body_preview_is_truncated,
    hs_publishing_task_content_id,
    hs_task_last_contact_outreach,
    hs_task_send_default_reminder,
    hs_conversation_session_is_bot,
    hs_conversation_session_online,
    hs_conversation_session_source,
    hs_email_send_event_id_created,
    hs_publishing_task_category_id,
    hs_email_recipient_drop_reasons,
    hs_meeting_created_from_link_id,
    hs_num_associated_queue_objects,
    hs_task_probability_to_complete,
    hs_unknown_visitor_conversation,
    hs_conversation_session_duration,
    hs_email_media_processing_status,
    hs_publishing_task_campaign_guid,
    hs_all_assigned_business_unit_ids,
    hs_conversation_session_thread_id,
    hs_email_pending_inline_image_ids,
    hs_task_sequence_enrollment_active,
    hs_publishing_task_campaign_step_id,
    hs_task_sequence_step_enrollment_id,
    hs_meeting_web_conference_meeting_id,
    hs_task_last_sales_activity_timestamp,
    hs_email_member_of_forwarded_subthread,
    hs_conversation_session_agent_join_time,
    hs_conversation_session_visitor_end_time,
    hs_conversation_session_session_closed_at,
    hs_conversation_session_visitor_wait_time,
    hs_meeting_pre_meeting_prospect_reminders,
    hs_user_ids_of_all_notification_followers,
    hs_conversation_session_num_agent_messages,
    hs_conversation_session_visitor_start_time,
    hs_conversation_session_agent_response_time,
    hs_email_encoded_email_associations_request,
    hs_email_migrated_via_portal_data_migration,
    hs_user_ids_of_all_notification_unfollowers,
    hs_conversation_sess___num_visitor_messages,
    _airbyte_emitted_at,
    _airbyte_properties_hashid
from {{ ref('hubspot_engagements_properties_ab3') }}
-- properties at hubspot_engagements/properties from {{ ref('hubspot_engagements') }}

