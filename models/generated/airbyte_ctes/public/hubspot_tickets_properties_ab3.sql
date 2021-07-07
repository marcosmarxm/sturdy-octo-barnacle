{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_hubspot_tickets_hashid',
        'tags',
        adapter.quote('content'),
        'subject',
        'nps_score',
        'num_notes',
        'created_by',
        'createdate',
        'source_ref',
        'closed_date',
        'hs_pipeline',
        'source_type',
        'hs_object_id',
        'hs_ticket_id',
        'hs_time_in_1',
        'hs_time_in_2',
        'hs_time_in_3',
        'hs_time_in_4',
        'hs_createdate',
        'hs_resolution',
        'time_to_close',
        'hs_file_upload',
        'hs_all_team_ids',
        'hs_custom_inbox',
        'hubspot_team_id',
        'last_reply_date',
        'hs_all_owner_ids',
        'hs_date_exited_1',
        'hs_date_exited_2',
        'hs_date_exited_3',
        'hs_date_exited_4',
        'hs_lastcontacted',
        'hubspot_owner_id',
        'source_thread_id',
        'hs_date_entered_1',
        'hs_date_entered_2',
        'hs_date_entered_3',
        'hs_date_entered_4',
        'hs_pipeline_stage',
        'hs_last_email_date',
        'hs_ticket_category',
        'hs_ticket_priority',
        'notes_last_updated',
        'hs_lastactivitydate',
        'hs_lastmodifieddate',
        'hs_nextactivitydate',
        'num_contacted_notes',
        'hs_merged_object_ids',
        'last_engagement_date',
        'notes_last_contacted',
        'nps_follow_up_answer',
        'hs_created_by_user_id',
        'hs_updated_by_user_id',
        'first_agent_reply_date',
        'hs_external_object_ids',
        'hs_last_email_activity',
        'hs_num_times_contacted',
        'hs_unique_creation_key',
        'hs_thread_ids_to_restore',
        'notes_next_activity_date',
        'hs_user_ids_of_all_owners',
        'time_to_first_agent_reply',
        'hs_all_accessible_team_ids',
        'hubspot_owner_assigneddate',
        'hs_num_associated_companies',
        'hs_sales_email_last_replied',
        'nps_follow_up_question_version',
        'hs_all_assigned_business_unit_ids',
        'hs_originating_email_engagement_id',
        'hs_conversations_originating_thread_id',
        'hs_conversations_originating_message_id',
        'hs_user_ids_of_all_notification_followers',
        'hs_user_ids_of_all_notification_unfollowers',
    ]) }} as _airbyte_properties_hashid
from {{ ref('hubspot_tickets_properties_ab2') }}
-- properties at hubspot_tickets/properties

