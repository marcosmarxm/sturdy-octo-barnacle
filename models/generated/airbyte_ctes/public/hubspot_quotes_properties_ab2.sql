{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_hubspot_quotes_hashid,
    cast(hs_terms as {{ dbt_utils.type_string() }}) as hs_terms,
    cast(hs_title as {{ dbt_utils.type_string() }}) as hs_title,
    cast(hs_locale as {{ dbt_utils.type_string() }}) as hs_locale,
    hs_locked,
    cast(hs_status as {{ dbt_utils.type_string() }}) as hs_status,
    cast(num_notes as {{ dbt_utils.type_float() }}) as num_notes,
    cast(hs_comments as {{ dbt_utils.type_string() }}) as hs_comments,
    cast(hs_currency as {{ dbt_utils.type_string() }}) as hs_currency,
    cast(hs_feedback as {{ dbt_utils.type_string() }}) as hs_feedback,
    cast(hs_language as {{ dbt_utils.type_string() }}) as hs_language,
    cast(hs_logo_url as {{ dbt_utils.type_string() }}) as hs_logo_url,
    cast(hs_template as {{ dbt_utils.type_string() }}) as hs_template,
    cast(hs_timezone as {{ dbt_utils.type_string() }}) as hs_timezone,
    cast(hs_object_id as {{ dbt_utils.type_float() }}) as hs_object_id,
    hs_createdate,
    hs_esign_date,
    cast(hs_approver_id as {{ dbt_utils.type_string() }}) as hs_approver_id,
    cast(hs_all_team_ids as {{ dbt_utils.type_string() }}) as hs_all_team_ids,
    hs_payment_date,
    cast(hs_quote_amount as {{ dbt_utils.type_float() }}) as hs_quote_amount,
    cast(hs_quote_number as {{ dbt_utils.type_string() }}) as hs_quote_number,
    cast(hs_sender_email as {{ dbt_utils.type_string() }}) as hs_sender_email,
    cast(hs_sender_phone as {{ dbt_utils.type_string() }}) as hs_sender_phone,
    cast(hubspot_team_id as {{ dbt_utils.type_string() }}) as hubspot_team_id,
    cast(hs_all_owner_ids as {{ dbt_utils.type_string() }}) as hs_all_owner_ids,
    hs_esign_enabled,
    cast(hs_primary_color as {{ dbt_utils.type_string() }}) as hs_primary_color,
    cast(hs_template_type as {{ dbt_utils.type_string() }}) as hs_template_type,
    cast(hubspot_owner_id as {{ dbt_utils.type_string() }}) as hubspot_owner_id,
    cast(hs_payment_status as {{ dbt_utils.type_string() }}) as hs_payment_status,
    cast(hs_public_url_key as {{ dbt_utils.type_string() }}) as hs_public_url_key,
    hs_expiration_date,
    hs_payment_enabled,
    cast(hs_sender_jobtitle as {{ dbt_utils.type_string() }}) as hs_sender_jobtitle,
    cast(hs_sender_lastname as {{ dbt_utils.type_string() }}) as hs_sender_lastname,
    notes_last_updated,
    hs_lastmodifieddate,
    cast(hs_sender_firstname as {{ dbt_utils.type_string() }}) as hs_sender_firstname,
    cast(hs_sender_image_url as {{ dbt_utils.type_string() }}) as hs_sender_image_url,
    cast(num_contacted_notes as {{ dbt_utils.type_float() }}) as num_contacted_notes,
    cast(hs_merged_object_ids as {{ dbt_utils.type_string() }}) as hs_merged_object_ids,
    cast(hs_pdf_download_link as {{ dbt_utils.type_string() }}) as hs_pdf_download_link,
    notes_last_contacted,
    cast(hs_created_by_user_id as {{ dbt_utils.type_float() }}) as hs_created_by_user_id,
    cast(hs_sender_company_zip as {{ dbt_utils.type_string() }}) as hs_sender_company_zip,
    hs_show_signature_box,
    cast(hs_updated_by_user_id as {{ dbt_utils.type_float() }}) as hs_updated_by_user_id,
    cast(hs_sender_company_city as {{ dbt_utils.type_string() }}) as hs_sender_company_city,
    cast(hs_sender_company_name as {{ dbt_utils.type_string() }}) as hs_sender_company_name,
    cast(hs_unique_creation_key as {{ dbt_utils.type_string() }}) as hs_unique_creation_key,
    cast(hs_num_associated_deals as {{ dbt_utils.type_float() }}) as hs_num_associated_deals,
    cast(hs_sender_company_state as {{ dbt_utils.type_string() }}) as hs_sender_company_state,
    cast(hs_sender_company_domain as {{ dbt_utils.type_string() }}) as hs_sender_company_domain,
    notes_next_activity_date,
    cast(hs_quote_total_preference as {{ dbt_utils.type_string() }}) as hs_quote_total_preference,
    cast(hs_sender_company_address as {{ dbt_utils.type_string() }}) as hs_sender_company_address,
    cast(hs_sender_company_country as {{ dbt_utils.type_string() }}) as hs_sender_company_country,
    cast(hs_user_ids_of_all_owners as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_owners,
    cast(hs_all_accessible_team_ids as {{ dbt_utils.type_string() }}) as hs_all_accessible_team_ids,
    cast(hs_sender_company_address2 as {{ dbt_utils.type_string() }}) as hs_sender_company_address2,
    hubspot_owner_assigneddate,
    hs_collect_shipping_address,
    hs_sales_email_last_replied,
    cast(hs_sender_company_image_url as {{ dbt_utils.type_string() }}) as hs_sender_company_image_url,
    hs_show_countersignature_box,
    cast(hs_esign_num_signers_required as {{ dbt_utils.type_float() }}) as hs_esign_num_signers_required,
    cast(hs_esign_num_signers_completed as {{ dbt_utils.type_float() }}) as hs_esign_num_signers_completed,
    cast(hs_all_assigned_business_unit_ids as {{ dbt_utils.type_string() }}) as hs_all_assigned_business_unit_ids,
    cast(hs_user_ids_of_all_notification_followers as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_notification_followers,
    cast(hs_user_ids_of_all_notification_unfollowers as {{ dbt_utils.type_string() }}) as hs_user_ids_of_all_notification_unfollowers,
    cast(hs_line_item_global___s_discount_percentage as {{ dbt_utils.type_string() }}) as hs_line_item_global___s_discount_percentage,
    cast(hs_line_item_global___rringbillingfrequency as {{ dbt_utils.type_string() }}) as hs_line_item_global___rringbillingfrequency,
    cast(hs_line_item_global___urring_billing_period as {{ dbt_utils.type_string() }}) as hs_line_item_global___urring_billing_period,
    hs_line_item_global___nt_percentage_enabled,
    cast(hs_line_item_global___ng_billing_start_date as {{ dbt_utils.type_string() }}) as hs_line_item_global___ng_billing_start_date,
    hs_line_item_global___lingfrequency_enabled,
    hs_line_item_global___illing_period_enabled,
    hs_line_item_global___ng_start_date_enabled,
    _airbyte_emitted_at
from {{ ref('hubspot_quotes_properties_ab1') }}
-- properties at hubspot_quotes/properties
