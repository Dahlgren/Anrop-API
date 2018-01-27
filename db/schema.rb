# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "fusion7_admin", primary_key: "admin_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "admin_rights", limit: 4, default: "", null: false
    t.string "admin_image", limit: 50, default: "", null: false
    t.string "admin_title", limit: 50, default: "", null: false
    t.string "admin_link", limit: 100, default: "reserved", null: false
    t.boolean "admin_page", default: true, null: false, unsigned: true
  end

  create_table "fusion7_admin_resetlog", primary_key: "reset_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "reset_admin_id", limit: 3, default: 1, null: false, unsigned: true
    t.integer "reset_timestamp", default: 0, null: false, unsigned: true
    t.text "reset_sucess", null: false
    t.text "reset_failed", null: false
    t.string "reset_admins", limit: 8, default: "0", null: false
    t.string "reset_reason", limit: 256, null: false
  end

  create_table "fusion7_arma3_votes", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.date "date"
    t.index ["user_id"], name: "user_id"
  end

  create_table "fusion7_article_cats", primary_key: "article_cat_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "article_cat_name", limit: 100, default: "", null: false
    t.string "article_cat_description", limit: 200, default: "", null: false
    t.string "article_cat_sorting", limit: 50, default: "article_subject ASC", null: false
    t.integer "article_cat_access", limit: 1, default: 0, null: false, unsigned: true
    t.index ["article_cat_access"], name: "article_cat_access"
  end

  create_table "fusion7_articles", primary_key: "article_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "article_cat", limit: 3, default: 0, unsigned: true
    t.string "article_subject", limit: 200, default: "", null: false
    t.text "article_snippet", null: false
    t.text "article_article", null: false
    t.boolean "article_draft", default: false, null: false, unsigned: true
    t.string "article_breaks", limit: 1, default: "", null: false
    t.integer "article_name", limit: 2, default: 1, null: false, unsigned: true
    t.integer "article_datestamp", default: 0, null: false, unsigned: true
    t.integer "article_reads", limit: 3, default: 0, unsigned: true
    t.boolean "article_allow_comments", default: true, null: false, unsigned: true
    t.boolean "article_allow_ratings", default: true, null: false, unsigned: true
    t.index ["article_cat"], name: "article_cat"
    t.index ["article_datestamp"], name: "article_datestamp"
    t.index ["article_reads"], name: "article_reads"
  end

  create_table "fusion7_bbcodes", primary_key: "bbcode_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "bbcode_name", limit: 20, default: "", null: false
    t.integer "bbcode_order", limit: 2, default: 0, null: false, unsigned: true
    t.index ["bbcode_order"], name: "bbcode_order"
  end

  create_table "fusion7_blacklist", primary_key: "blacklist_id", id: :integer, limit: 2, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "blacklist_user_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "blacklist_ip", limit: 45, default: "", null: false
    t.boolean "blacklist_ip_type", default: true, null: false, unsigned: true
    t.string "blacklist_email", limit: 100, default: "", null: false
    t.text "blacklist_reason", null: false
    t.integer "blacklist_datestamp", default: 0, null: false, unsigned: true
    t.index ["blacklist_ip_type"], name: "blacklist_ip_type"
  end

  create_table "fusion7_captcha", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "captcha_datestamp", default: 0, null: false, unsigned: true
    t.string "captcha_ip", limit: 45, default: "", null: false
    t.boolean "captcha_ip_type", default: true, null: false, unsigned: true
    t.string "captcha_encode", limit: 32, default: "", null: false
    t.string "captcha_string", limit: 15, default: "", null: false
    t.index ["captcha_datestamp"], name: "captcha_datestamp"
  end

  create_table "fusion7_comments", primary_key: "comment_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "comment_item_id", limit: 2, default: 0, null: false, unsigned: true
    t.string "comment_type", limit: 2, default: "", null: false
    t.string "comment_name", limit: 50, default: "", null: false
    t.text "comment_message", null: false
    t.integer "comment_datestamp", default: 0, null: false, unsigned: true
    t.string "comment_ip", limit: 45, default: "", null: false
    t.boolean "comment_ip_type", default: true, null: false, unsigned: true
    t.boolean "comment_hidden", default: false, null: false, unsigned: true
    t.index ["comment_datestamp"], name: "comment_datestamp"
  end

  create_table "fusion7_custom_pages", primary_key: "page_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "page_title", limit: 200, default: "", null: false
    t.integer "page_access", limit: 1, default: 0, null: false, unsigned: true
    t.text "page_content", null: false
    t.boolean "page_allow_comments", default: false, null: false, unsigned: true
    t.boolean "page_allow_ratings", default: false, null: false, unsigned: true
  end

  create_table "fusion7_download_cats", primary_key: "download_cat_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "download_cat_name", limit: 100, default: "", null: false
    t.text "download_cat_description", null: false
    t.string "download_cat_sorting", limit: 50, default: "download_title ASC", null: false
    t.integer "download_cat_access", limit: 1, default: 0, null: false, unsigned: true
  end

  create_table "fusion7_downloads", primary_key: "download_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "download_user", limit: 3, default: 1, null: false, unsigned: true
    t.string "download_homepage", limit: 100, default: "", null: false
    t.string "download_title", limit: 100, default: "", null: false
    t.string "download_description_short", limit: 500, null: false
    t.text "download_description", null: false
    t.string "download_image", limit: 100, default: "", null: false
    t.string "download_image_thumb", limit: 100, default: "", null: false
    t.string "download_url", limit: 200, default: "", null: false
    t.string "download_file", limit: 100, default: "", null: false
    t.integer "download_cat", limit: 3, default: 0, unsigned: true
    t.string "download_license", limit: 50, default: "", null: false
    t.string "download_copyright", limit: 250, default: "", null: false
    t.string "download_os", limit: 50, default: "", null: false
    t.string "download_version", limit: 20, default: "", null: false
    t.string "download_filesize", limit: 20, default: "", null: false
    t.integer "download_datestamp", default: 0, null: false, unsigned: true
    t.integer "download_count", limit: 2, default: 0, null: false, unsigned: true
    t.boolean "download_allow_comments", default: false, null: false, unsigned: true
    t.boolean "download_allow_ratings", default: false, null: false, unsigned: true
    t.index ["download_datestamp"], name: "download_datestamp"
  end

  create_table "fusion7_email_verify", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", limit: 3, null: false
    t.string "user_code", limit: 32, null: false
    t.string "user_email", limit: 100, null: false
    t.integer "user_datestamp", default: 0, null: false, unsigned: true
    t.index ["user_datestamp"], name: "user_datestamp"
  end

  create_table "fusion7_errors", primary_key: "error_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "error_level", limit: 2, null: false, unsigned: true
    t.text "error_message", null: false
    t.string "error_file", limit: 300, null: false
    t.integer "error_line", limit: 2, null: false
    t.string "error_page", limit: 200, null: false
    t.integer "error_user_level", limit: 2, null: false
    t.string "error_user_ip", limit: 45, default: "", null: false
    t.boolean "error_user_ip_type", default: true, null: false, unsigned: true
    t.boolean "error_status", default: false, null: false
    t.integer "error_timestamp", null: false
  end

  create_table "fusion7_faq_cats", primary_key: "faq_cat_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "faq_cat_name", limit: 200, default: "", null: false
    t.string "faq_cat_description", limit: 250, default: "", null: false
  end

  create_table "fusion7_faqs", primary_key: "faq_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "faq_cat_id", limit: 3, default: 0, unsigned: true
    t.string "faq_question", limit: 200, default: "", null: false
    t.text "faq_answer", null: false
  end

  create_table "fusion7_flood_control", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "flood_ip", limit: 45, default: "", null: false
    t.boolean "flood_ip_type", default: true, null: false, unsigned: true
    t.integer "flood_timestamp", default: 0, null: false, unsigned: true
    t.index ["flood_timestamp"], name: "flood_timestamp"
  end

  create_table "fusion7_forum_attachments", primary_key: "attach_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "thread_id", limit: 3, default: 0, unsigned: true
    t.integer "post_id", limit: 3, default: 0, unsigned: true
    t.string "attach_name", limit: 100, default: "", null: false
    t.string "attach_ext", limit: 5, default: "", null: false
    t.integer "attach_size", default: 0, null: false, unsigned: true
    t.integer "attach_count", default: 0, null: false, unsigned: true
  end

  create_table "fusion7_forum_poll_options", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "thread_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "forum_poll_option_id", limit: 2, default: 0, null: false, unsigned: true
    t.string "forum_poll_option_text", limit: 150, default: "", null: false
    t.integer "forum_poll_option_votes", limit: 2, default: 0, null: false, unsigned: true
    t.index ["thread_id"], name: "thread_id"
  end

  create_table "fusion7_forum_poll_voters", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "thread_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "forum_vote_user_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "forum_vote_user_ip", limit: 45, default: "", null: false
    t.boolean "forum_vote_user_ip_type", default: true, null: false, unsigned: true
    t.index ["thread_id", "forum_vote_user_id"], name: "thread_id"
  end

  create_table "fusion7_forum_polls", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "thread_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "forum_poll_title", limit: 250, default: "", null: false
    t.integer "forum_poll_start", unsigned: true
    t.integer "forum_poll_length", default: 0, null: false, unsigned: true
    t.integer "forum_poll_votes", limit: 2, default: 0, null: false, unsigned: true
    t.index ["thread_id"], name: "thread_id"
  end

  create_table "fusion7_forum_ranks", primary_key: "rank_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "rank_title", limit: 100, default: "", null: false
    t.string "rank_image", limit: 100, default: "", null: false
    t.integer "rank_posts", default: 0, null: false, unsigned: true
    t.boolean "rank_type", default: false, null: false, unsigned: true
    t.integer "rank_apply", limit: 2, default: 101, null: false, unsigned: true
  end

  create_table "fusion7_forums", primary_key: "forum_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "forum_cat", limit: 3, default: 0, unsigned: true
    t.string "forum_name", limit: 100, default: "", null: false
    t.integer "forum_order", limit: 2, default: 0, null: false, unsigned: true
    t.text "forum_description", null: false
    t.text "forum_moderators", null: false
    t.integer "forum_access", limit: 1, default: 0, null: false, unsigned: true
    t.integer "forum_post", limit: 2, default: 101, unsigned: true
    t.integer "forum_poll", limit: 2, default: 0, null: false, unsigned: true
    t.integer "forum_vote", limit: 2, default: 0, null: false, unsigned: true
    t.integer "forum_reply", limit: 2, default: 0, null: false, unsigned: true
    t.integer "forum_attach", limit: 2, default: 0, null: false, unsigned: true
    t.integer "forum_attach_download", limit: 2, default: 0, null: false, unsigned: true
    t.integer "forum_lastpost", default: 0, null: false, unsigned: true
    t.integer "forum_postcount", limit: 3, default: 0, null: false, unsigned: true
    t.integer "forum_threadcount", limit: 3, default: 0, null: false, unsigned: true
    t.integer "forum_lastuser", limit: 2, default: 0, null: false, unsigned: true
    t.boolean "forum_merge", default: false, null: false, unsigned: true
    t.index ["forum_lastpost"], name: "forum_lastpost"
    t.index ["forum_order"], name: "forum_order"
    t.index ["forum_postcount"], name: "forum_postcount"
    t.index ["forum_threadcount"], name: "forum_threadcount"
  end

  create_table "fusion7_infusions", primary_key: "inf_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "inf_title", limit: 100, default: "", null: false
    t.string "inf_folder", limit: 100, default: "", null: false
    t.string "inf_version", limit: 10, default: "0", null: false
  end

  create_table "fusion7_language_sessions", primary_key: "user_ip", id: :string, limit: 45, default: "0.0.0.0", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "user_language", limit: 50, default: "English", null: false
    t.integer "user_datestamp", default: 0, null: false, unsigned: true
  end

  create_table "fusion7_messages", primary_key: "message_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "message_to", limit: 3, default: 0, unsigned: true
    t.integer "message_from", limit: 3, default: 0, unsigned: true
    t.string "message_subject", limit: 100, default: "", null: false
    t.text "message_message", null: false
    t.string "message_smileys", limit: 1, default: "", null: false
    t.boolean "message_read", default: false, null: false, unsigned: true
    t.integer "message_datestamp", default: 0, null: false, unsigned: true
    t.boolean "message_folder", default: false, null: false, unsigned: true
    t.index ["message_datestamp"], name: "message_datestamp"
  end

  create_table "fusion7_messages_options", primary_key: "user_id", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.boolean "pm_email_notify", default: false, null: false, unsigned: true
    t.boolean "pm_save_sent", default: false, null: false, unsigned: true
    t.integer "pm_inbox", limit: 2, default: 0, null: false, unsigned: true
    t.integer "pm_savebox", limit: 2, default: 0, null: false, unsigned: true
    t.integer "pm_sentbox", limit: 2, default: 0, null: false, unsigned: true
  end

  create_table "fusion7_missions", id: :integer, limit: 2, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "mission_name", limit: 50, default: "", null: false
    t.integer "creator", limit: 2, default: 0, null: false, unsigned: true
    t.string "type", limit: 20, default: "", null: false
    t.string "players", limit: 10, default: "", null: false
    t.string "map", limit: 20, default: "", null: false
    t.text "addons", null: false
    t.string "version", limit: 10, default: "1", null: false
    t.date "date", null: false
    t.string "filename", limit: 100, default: "", null: false
  end

  create_table "fusion7_new_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "user_code", limit: 40, null: false
    t.string "user_name", limit: 30, null: false
    t.string "user_email", limit: 100, default: "", null: false
    t.integer "user_datestamp", default: 0, null: false, unsigned: true
    t.text "user_info", null: false
    t.index ["user_datestamp"], name: "user_datestamp"
  end

  create_table "fusion7_news", primary_key: "news_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "news_subject", limit: 200, default: "", null: false
    t.integer "news_cat", limit: 3, default: 0, unsigned: true
    t.string "news_image", limit: 100, default: "", null: false
    t.string "news_image_t1", limit: 100, default: "", null: false
    t.string "news_image_t2", limit: 100, default: "", null: false
    t.text "news_news", null: false
    t.text "news_extended", null: false
    t.string "news_breaks", limit: 1, default: "", null: false
    t.integer "news_name", limit: 2, default: 1, null: false, unsigned: true
    t.integer "news_datestamp", default: 0, null: false, unsigned: true
    t.integer "news_start", default: 0, null: false, unsigned: true
    t.integer "news_end", default: 0, null: false, unsigned: true
    t.integer "news_visibility", limit: 1, default: 0, null: false, unsigned: true
    t.integer "news_reads", limit: 3, default: 0, unsigned: true
    t.boolean "news_draft", default: false, null: false, unsigned: true
    t.boolean "news_sticky", default: false, null: false, unsigned: true
    t.boolean "news_allow_comments", default: true, null: false, unsigned: true
    t.boolean "news_allow_ratings", default: true, null: false, unsigned: true
    t.index ["news_datestamp"], name: "news_datestamp"
    t.index ["news_reads"], name: "news_reads"
  end

  create_table "fusion7_news_cats", primary_key: "news_cat_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "news_cat_name", limit: 100, default: "", null: false
    t.string "news_cat_image", limit: 100, default: "", null: false
  end

  create_table "fusion7_online", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "online_user", limit: 50, default: "", null: false
    t.string "online_ip", limit: 45, default: "", null: false
    t.boolean "online_ip_type", default: true, null: false, unsigned: true
    t.integer "online_lastactive", default: 0, null: false, unsigned: true
  end

  create_table "fusion7_operations", primary_key: "operation_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "thread_id", unsigned: true
    t.string "operation_title", default: "", null: false
    t.text "operation_text"
    t.string "operation_image"
    t.datetime "operation_datetime", null: false
    t.integer "operation_author", null: false
    t.integer "operation_hidden", default: 1, null: false
    t.integer "operation_locked", default: 0, null: false
    t.timestamp "operation_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "fusion7_operations_aar", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "operation_id", null: false, unsigned: true
    t.integer "aar_id", null: false, unsigned: true
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["operation_id"], name: "operation_id"
  end

  create_table "fusion7_operations_addons", primary_key: "addon_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "operation_id", null: false, unsigned: true
    t.string "addon_name", limit: 200
    t.string "addon_url", limit: 200
    t.timestamp "addon_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["operation_id"], name: "operation_id"
  end

  create_table "fusion7_operations_groups", primary_key: "group_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "operation_id", null: false, unsigned: true
    t.string "group_title", limit: 150, default: "", null: false
    t.integer "group_order", default: 0, null: false
    t.timestamp "group_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["operation_id"], name: "operation_id"
  end

  create_table "fusion7_operations_pws", primary_key: "pws_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "operation_id", null: false, unsigned: true
    t.string "pws_name", limit: 200
    t.timestamp "pws_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["operation_id"], name: "operation_id"
  end

  create_table "fusion7_operations_slots", primary_key: "slot_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "group_id", null: false, unsigned: true
    t.string "slot_title", limit: 150, default: "", null: false
    t.integer "user_id", unsigned: true
    t.boolean "slot_locked", default: false, null: false, unsigned: true
    t.integer "slot_order", default: 0, null: false
    t.timestamp "slot_updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["group_id"], name: "group_id"
  end

  create_table "fusion7_operations_steam_workshop", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "operation_id", null: false, unsigned: true
    t.integer "steam_workshop_id", null: false, unsigned: true
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["operation_id"], name: "operation_id"
  end

  create_table "fusion7_panels", primary_key: "panel_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "panel_name", limit: 100, default: "", null: false
    t.string "panel_filename", limit: 100, default: "", null: false
    t.text "panel_content", null: false
    t.boolean "panel_side", default: true, null: false, unsigned: true
    t.integer "panel_order", limit: 2, default: 0, null: false, unsigned: true
    t.string "panel_type", limit: 20, default: "", null: false
    t.integer "panel_access", limit: 1, default: 0, null: false, unsigned: true
    t.boolean "panel_display", default: false, null: false, unsigned: true
    t.boolean "panel_status", default: false, null: false, unsigned: true
    t.text "panel_url_list", null: false
    t.boolean "panel_restriction", default: false, null: false, unsigned: true
    t.index ["panel_order"], name: "panel_order"
  end

  create_table "fusion7_photo_albums", primary_key: "album_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "album_title", limit: 100, default: "", null: false
    t.text "album_description", null: false
    t.string "album_thumb", limit: 100, default: "", null: false
    t.integer "album_user", limit: 2, default: 0, null: false, unsigned: true
    t.integer "album_access", limit: 2, default: 0, null: false, unsigned: true
    t.integer "album_order", limit: 2, default: 0, null: false, unsigned: true
    t.integer "album_datestamp", default: 0, null: false, unsigned: true
    t.index ["album_datestamp"], name: "album_datestamp"
    t.index ["album_order"], name: "album_order"
  end

  create_table "fusion7_photos", primary_key: "photo_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "album_id", limit: 3, default: 0, unsigned: true
    t.string "photo_title", limit: 100, default: "", null: false
    t.text "photo_description", null: false
    t.string "photo_filename", limit: 100, default: "", null: false
    t.string "photo_thumb1", limit: 100, default: "", null: false
    t.string "photo_thumb2", limit: 100, default: "", null: false
    t.integer "photo_datestamp", default: 0, null: false, unsigned: true
    t.integer "photo_user", limit: 2, default: 0, null: false, unsigned: true
    t.integer "photo_views", limit: 2, default: 0, null: false, unsigned: true
    t.integer "photo_order", limit: 2, default: 0, null: false, unsigned: true
    t.boolean "photo_allow_comments", default: true, null: false, unsigned: true
    t.boolean "photo_allow_ratings", default: true, null: false, unsigned: true
    t.index ["photo_datestamp"], name: "photo_datestamp"
    t.index ["photo_order"], name: "photo_order"
  end

  create_table "fusion7_poll_votes", primary_key: "vote_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "vote_user", limit: 2, default: 0, null: false, unsigned: true
    t.integer "vote_opt", limit: 2, default: 0, null: false, unsigned: true
    t.integer "poll_id", limit: 3, default: 0, unsigned: true
  end

  create_table "fusion7_polls", primary_key: "poll_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "poll_title", limit: 200, default: "", null: false
    t.string "poll_opt_0", limit: 200, default: "", null: false
    t.string "poll_opt_1", limit: 200, default: "", null: false
    t.string "poll_opt_2", limit: 200, default: "", null: false
    t.string "poll_opt_3", limit: 200, default: "", null: false
    t.string "poll_opt_4", limit: 200, default: "", null: false
    t.string "poll_opt_5", limit: 200, default: "", null: false
    t.string "poll_opt_6", limit: 200, default: "", null: false
    t.string "poll_opt_7", limit: 200, default: "", null: false
    t.string "poll_opt_8", limit: 200, default: "", null: false
    t.string "poll_opt_9", limit: 200, default: "", null: false
    t.integer "poll_started", default: 0, null: false, unsigned: true
    t.integer "poll_ended", default: 0, null: false, unsigned: true
  end

  create_table "fusion7_posts", primary_key: "post_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "forum_id", limit: 3, default: 0, unsigned: true
    t.integer "thread_id", limit: 3, default: 0, unsigned: true
    t.text "post_message", null: false
    t.boolean "post_showsig", default: false, null: false, unsigned: true
    t.boolean "post_smileys", default: true, null: false, unsigned: true
    t.integer "post_author", limit: 2, default: 0, null: false, unsigned: true
    t.integer "post_datestamp", default: 0, null: false, unsigned: true
    t.string "post_ip", limit: 45, default: "", null: false
    t.boolean "post_ip_type", default: true, null: false, unsigned: true
    t.integer "post_edituser", limit: 2, default: 0, null: false, unsigned: true
    t.integer "post_edittime", default: 0, null: false, unsigned: true
    t.text "post_editreason", null: false
    t.boolean "post_hidden", default: false, null: false, unsigned: true
    t.boolean "post_locked", default: false, null: false, unsigned: true
    t.index ["post_datestamp"], name: "post_datestamp"
    t.index ["post_datestamp"], name: "post_datestamp_2"
    t.index ["thread_id"], name: "thread_id"
  end

  create_table "fusion7_ratings", primary_key: "rating_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "rating_item_id", limit: 3, default: 0, unsigned: true
    t.string "rating_type", limit: 1, default: "", null: false
    t.integer "rating_user", limit: 2, default: 0, null: false, unsigned: true
    t.boolean "rating_vote", default: false, null: false, unsigned: true
    t.integer "rating_datestamp", default: 0, null: false, unsigned: true
    t.string "rating_ip", limit: 45, default: "", null: false
    t.boolean "rating_ip_type", default: true, null: false, unsigned: true
  end

  create_table "fusion7_settings", primary_key: "settings_name", id: :string, limit: 200, default: "", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "settings_value", null: false
  end

  create_table "fusion7_settings_inf", primary_key: "settings_name", id: :string, limit: 200, default: "", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "settings_value", null: false
    t.string "settings_inf", limit: 200, default: "", null: false
  end

  create_table "fusion7_shoutbox", primary_key: "shout_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "shout_name", limit: 50, default: "", null: false
    t.string "shout_message", default: "", null: false
    t.integer "shout_datestamp", default: 0, null: false, unsigned: true
    t.string "shout_ip", limit: 45, default: "", null: false
    t.boolean "shout_ip_type", default: true, null: false, unsigned: true
    t.boolean "shout_hidden", default: false, null: false, unsigned: true
    t.index ["shout_datestamp"], name: "shout_datestamp"
  end

  create_table "fusion7_site_links", primary_key: "link_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "link_name", limit: 100, default: "", null: false
    t.string "link_url", limit: 200, default: "", null: false
    t.integer "link_visibility", limit: 1, default: 0, null: false, unsigned: true
    t.boolean "link_position", default: true, null: false, unsigned: true
    t.boolean "link_window", default: false, null: false, unsigned: true
    t.integer "link_order", limit: 2, default: 0, null: false, unsigned: true
  end

  create_table "fusion7_sitemapxml", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "update_interval", limit: 3, default: 86400, null: false, unsigned: true
    t.string "site_url", limit: 200, default: "", null: false
    t.boolean "news_enabled", default: true, null: false, unsigned: true
    t.boolean "news_changefreq", default: false, null: false, unsigned: true
    t.string "news_priority", limit: 3, default: "0.6", null: false
    t.boolean "newscats_enabled", default: true, null: false, unsigned: true
    t.boolean "newscats_changefreq", default: true, null: false, unsigned: true
    t.string "newscats_priority", limit: 3, default: "0.2", null: false
    t.boolean "articlecats_enabled", default: true, null: false, unsigned: true
    t.boolean "articlecats_changefreq", default: false, null: false, unsigned: true
    t.string "articlecats_priority", limit: 3, default: "0.2", null: false
    t.boolean "articles_enabled", default: true, null: false, unsigned: true
    t.boolean "articles_changefreq", default: true, null: false, unsigned: true
    t.string "articles_priority", limit: 3, default: "0.5", null: false
    t.boolean "profiles_enabled", default: true, null: false, unsigned: true
    t.boolean "profiles_changefreq", default: true, null: false, unsigned: true
    t.string "profiles_priority", limit: 3, default: "0.1", null: false
    t.boolean "photoalbums_enabled", default: true, null: false, unsigned: true
    t.boolean "photoalbums_changefreq", default: false, null: false, unsigned: true
    t.string "photoalbums_priority", limit: 3, default: "0.2", null: false
    t.boolean "photos_enabled", default: true, null: false, unsigned: true
    t.boolean "photos_changefreq", default: false, null: false, unsigned: true
    t.string "photos_priority", limit: 3, default: "0.3", null: false
    t.boolean "custompages_enabled", default: true, null: false, unsigned: true
    t.boolean "custompages_changefreq", default: true, null: false, unsigned: true
    t.string "custompages_priority", limit: 3, default: "0.3", null: false
    t.boolean "faqcats_enabled", default: true, null: false, unsigned: true
    t.boolean "faqcats_changefreq", default: true, null: false, unsigned: true
    t.string "faqcats_priority", limit: 3, default: "0.3", null: false
    t.boolean "downloadcats_enabled", default: true, null: false, unsigned: true
    t.boolean "downloadcats_changefreq", default: true, null: false, unsigned: true
    t.string "downloadcats_priority", limit: 3, default: "0.3", null: false
    t.boolean "downloads_enabled", default: true, null: false, unsigned: true
    t.boolean "downloads_changefreq", default: true, null: false, unsigned: true
    t.string "downloads_priority", limit: 3, default: "0.4", null: false
    t.boolean "weblinkcats_enabled", default: true, null: false, unsigned: true
    t.boolean "weblinkcats_changefreq", default: true, null: false, unsigned: true
    t.string "weblinkcats_priority", limit: 3, default: "0.3", null: false
    t.boolean "forums_enabled", default: true, null: false, unsigned: true
    t.boolean "forums_changefreq", default: true, null: false, unsigned: true
    t.string "forums_priority", limit: 3, default: "0.4", null: false
    t.boolean "threads_enabled", default: true, null: false, unsigned: true
    t.boolean "threads_changefreq", default: false, null: false, unsigned: true
    t.string "threads_priority", limit: 3, default: "0.6", null: false
    t.integer "threads_limit", limit: 3, default: 0, null: false, unsigned: true
    t.boolean "kroaxcats_enabled", default: false, null: false, unsigned: true
    t.boolean "kroaxcats_changefreq", default: false, null: false, unsigned: true
    t.string "kroaxcats_priority", limit: 3, default: "0.1", null: false
    t.boolean "kroaxvideos_enabled", default: false, null: false, unsigned: true
    t.boolean "kroaxvideos_changefreq", default: false, null: false, unsigned: true
    t.string "kroaxvideos_priority", limit: 3, default: "0.3", null: false
    t.boolean "varcadecats_enabled", default: false, null: false, unsigned: true
    t.boolean "varcadecats_changefreq", default: true, null: false, unsigned: true
    t.string "varcadecats_priority", limit: 3, default: "0.3", null: false
    t.boolean "varcadegames_enabled", default: false, null: false, unsigned: true
    t.boolean "varcadegames_changefreq", default: true, null: false, unsigned: true
    t.string "varcadegames_priority", limit: 3, default: "0.3", null: false
    t.boolean "pdpcats_enabled", default: false, null: false, unsigned: true
    t.boolean "pdpcats_changefreq", default: true, null: false, unsigned: true
    t.string "pdpcats_priority", limit: 3, default: "0.2", null: false
    t.boolean "pdpdownloads_enabled", default: false, null: false, unsigned: true
    t.boolean "pdpdownloads_changefreq", default: true, null: false, unsigned: true
    t.string "pdpdownloads_priority", limit: 3, default: "0.3", null: false
    t.boolean "tiblogsystem_enabled", default: false, null: false, unsigned: true
    t.boolean "tiblogsystem_changefreq", default: true, null: false, unsigned: true
    t.string "tiblogsystem_priority", limit: 3, default: "0.3", null: false
  end

  create_table "fusion7_sitemapxml_customlinks", primary_key: "link_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "link_url", null: false
    t.boolean "link_frequency", default: true, null: false, unsigned: true
    t.string "link_priority", limit: 3, default: "0.4", null: false
  end

  create_table "fusion7_smileys", primary_key: "smiley_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "smiley_code", limit: 50, default: "", null: false
    t.string "smiley_image", limit: 100, default: "", null: false
    t.string "smiley_text", limit: 100, default: "", null: false
  end

  create_table "fusion7_submissions", primary_key: "submit_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "submit_type", limit: 1, default: "", null: false
    t.integer "submit_user", limit: 3, default: 0, unsigned: true
    t.integer "submit_datestamp", default: 0, null: false, unsigned: true
    t.text "submit_criteria", null: false
  end

  create_table "fusion7_suspends", primary_key: "suspend_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "suspended_user", limit: 3, null: false, unsigned: true
    t.integer "suspending_admin", limit: 3, default: 1, null: false, unsigned: true
    t.string "suspend_ip", limit: 45, default: "", null: false
    t.boolean "suspend_ip_type", default: true, null: false, unsigned: true
    t.integer "suspend_date", default: 0, null: false
    t.text "suspend_reason", null: false
    t.boolean "suspend_type", default: false, null: false
    t.integer "reinstating_admin", limit: 3, default: 1, null: false, unsigned: true
    t.text "reinstate_reason", null: false
    t.integer "reinstate_date", default: 0, null: false
    t.string "reinstate_ip", limit: 45, default: "", null: false
    t.boolean "reinstate_ip_type", default: true, null: false, unsigned: true
  end

  create_table "fusion7_thread_notify", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "thread_id", limit: 3, default: 0, unsigned: true
    t.integer "notify_datestamp", default: 0, null: false, unsigned: true
    t.integer "notify_user", limit: 3, default: 0, unsigned: true
    t.boolean "notify_status", default: true, null: false, unsigned: true
    t.index ["notify_datestamp"], name: "notify_datestamp"
  end

  create_table "fusion7_threads", primary_key: "thread_id", id: :integer, limit: 2, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "forum_id", limit: 2, default: 0, null: false, unsigned: true
    t.string "thread_subject", limit: 100, default: "", null: false
    t.integer "thread_author", limit: 2, default: 0, null: false, unsigned: true
    t.integer "thread_views", default: 0, null: false, unsigned: true
    t.integer "thread_lastpost", default: 0, null: false, unsigned: true
    t.integer "thread_lastpostid", limit: 3, default: 0, null: false, unsigned: true
    t.integer "thread_postcount", limit: 2, default: 0, null: false, unsigned: true
    t.integer "thread_lastuser", limit: 2, default: 0, null: false, unsigned: true
    t.boolean "thread_poll", default: false, null: false, unsigned: true
    t.boolean "thread_sticky", default: false, null: false, unsigned: true
    t.boolean "thread_locked", default: false, null: false, unsigned: true
    t.boolean "thread_hidden", default: false, null: false, unsigned: true
    t.index ["thread_lastpost"], name: "thread_lastpost"
    t.index ["thread_postcount"], name: "thread_postcount"
    t.index ["thread_views"], name: "thread_views"
  end

  create_table "fusion7_user_field_cats", primary_key: "field_cat_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "field_cat_name", limit: 200, null: false
    t.integer "field_cat_order", limit: 2, null: false, unsigned: true
  end

  create_table "fusion7_user_fields", primary_key: "field_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "field_name", limit: 50, default: "", null: false
    t.integer "field_cat", limit: 3, default: 1, unsigned: true
    t.boolean "field_required", default: false, null: false, unsigned: true
    t.boolean "field_log", default: false, null: false, unsigned: true
    t.boolean "field_registration", default: false, null: false, unsigned: true
    t.integer "field_order", limit: 2, default: 0, null: false, unsigned: true
    t.index ["field_order"], name: "field_order"
  end

  create_table "fusion7_user_groups", primary_key: "group_id", id: :integer, limit: 1, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "group_name", limit: 100, default: "", null: false
    t.string "group_description", limit: 200, default: "", null: false
  end

  create_table "fusion7_user_log", primary_key: "userlog_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "userlog_user_id", limit: 3, default: 0, null: false, unsigned: true
    t.string "userlog_field", limit: 50, default: "", null: false
    t.text "userlog_value_new", null: false
    t.text "userlog_value_old", null: false
    t.integer "userlog_timestamp", default: 0, null: false, unsigned: true
    t.index ["userlog_field"], name: "userlog_field"
    t.index ["userlog_user_id"], name: "userlog_user_id"
  end

  create_table "fusion7_users", primary_key: "user_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "user_name", limit: 30, default: "", null: false
    t.string "user_algo", limit: 10, default: "md5", null: false
    t.string "user_salt", limit: 40, null: false
    t.string "user_password", limit: 64, null: false
    t.string "user_admin_algo", limit: 10, default: "md5", null: false
    t.string "user_admin_salt", limit: 40, null: false
    t.string "user_admin_password", limit: 64, null: false
    t.string "user_email", limit: 100, default: "", null: false
    t.boolean "user_hide_email", default: true, null: false, unsigned: true
    t.string "user_location", limit: 50, default: "", null: false
    t.date "user_birthdate", null: false
    t.string "user_aim", limit: 16, default: "", null: false
    t.string "user_icq", limit: 15, default: "", null: false
    t.string "user_msn", limit: 100, default: "", null: false
    t.string "user_yahoo", limit: 100, default: "", null: false
    t.string "user_web", limit: 200, default: "", null: false
    t.string "user_theme", limit: 100, default: "Default", null: false
    t.string "user_offset", limit: 5, default: "0"
    t.string "user_avatar", limit: 100, default: "", null: false
    t.text "user_sig", null: false
    t.integer "user_posts", limit: 2, default: 0, null: false, unsigned: true
    t.text "user_threads", null: false
    t.integer "user_joined", default: 0, null: false, unsigned: true
    t.integer "user_lastvisit", default: 0, null: false, unsigned: true
    t.string "user_ip", limit: 45, default: "0.0.0.0", null: false
    t.boolean "user_ip_type", default: true, null: false, unsigned: true
    t.text "user_rights", null: false
    t.text "user_groups", null: false
    t.integer "user_level", limit: 1, default: 101, null: false, unsigned: true
    t.boolean "user_status", default: false, null: false, unsigned: true
    t.integer "user_actiontime", default: 0, null: false, unsigned: true
    t.string "user_arma2_id", limit: 20, default: "", null: false
    t.string "user_arma2_nick", limit: 50, default: "", null: false
    t.string "user_arma3_id", limit: 20, default: "", null: false
    t.string "user_arma3_nick", limit: 50, default: "", null: false
    t.string "user_twitch"
    t.string "user_arma1_id", limit: 50, default: "", null: false
    t.string "user_arma1_nick", limit: 50, default: "", null: false
    t.string "user_ofp_id", limit: 50, default: "", null: false
    t.string "user_ofp_nick", limit: 50, default: "", null: false
    t.index ["user_joined"], name: "user_joined"
    t.index ["user_lastvisit"], name: "user_lastvisit"
    t.index ["user_name"], name: "user_name"
  end

  create_table "fusion7_weblink_cats", primary_key: "weblink_cat_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "weblink_cat_name", limit: 100, default: "", null: false
    t.text "weblink_cat_description", null: false
    t.string "weblink_cat_sorting", limit: 50, default: "weblink_name ASC", null: false
    t.integer "weblink_cat_access", limit: 1, default: 0, null: false, unsigned: true
  end

  create_table "fusion7_weblinks", primary_key: "weblink_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "weblink_name", limit: 100, default: "", null: false
    t.text "weblink_description", null: false
    t.string "weblink_url", limit: 200, default: "", null: false
    t.integer "weblink_cat", limit: 3, default: 0, unsigned: true
    t.integer "weblink_datestamp", default: 0, null: false, unsigned: true
    t.integer "weblink_count", limit: 2, default: 0, null: false, unsigned: true
    t.index ["weblink_count"], name: "weblink_count"
    t.index ["weblink_datestamp"], name: "weblink_datestamp"
  end

end
