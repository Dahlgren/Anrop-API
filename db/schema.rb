# encoding: UTF-8
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

  create_table "fusion7_admin", primary_key: "admin_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "admin_rights", limit: 4,   default: "",         null: false
    t.string  "admin_image",  limit: 50,  default: "",         null: false
    t.string  "admin_title",  limit: 50,  default: "",         null: false
    t.string  "admin_link",   limit: 100, default: "reserved", null: false
    t.boolean "admin_page",               default: true,       null: false, unsigned: true
  end

  create_table "fusion7_admin_resetlog", primary_key: "reset_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "reset_admin_id",  limit: 3,     default: 1,   null: false, unsigned: true
    t.integer "reset_timestamp",               default: 0,   null: false, unsigned: true
    t.text    "reset_sucess",    limit: 65535,               null: false
    t.text    "reset_failed",    limit: 65535,               null: false
    t.string  "reset_admins",    limit: 8,     default: "0", null: false
    t.string  "reset_reason",    limit: 256,                 null: false
  end

  create_table "fusion7_arma3_votes", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.date    "date"
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "fusion7_article_cats", primary_key: "article_cat_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "article_cat_name",        limit: 100, default: "",                    null: false
    t.string  "article_cat_description", limit: 200, default: "",                    null: false
    t.string  "article_cat_sorting",     limit: 50,  default: "article_subject ASC", null: false
    t.integer "article_cat_access",      limit: 1,   default: 0,                     null: false, unsigned: true
    t.index ["article_cat_access"], name: "article_cat_access", using: :btree
  end

  create_table "fusion7_articles", primary_key: "article_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "article_cat",            limit: 3,     default: 0,                  unsigned: true
    t.string  "article_subject",        limit: 200,   default: "",    null: false
    t.text    "article_snippet",        limit: 65535,                 null: false
    t.text    "article_article",        limit: 65535,                 null: false
    t.boolean "article_draft",                        default: false, null: false, unsigned: true
    t.string  "article_breaks",         limit: 1,     default: "",    null: false
    t.integer "article_name",           limit: 2,     default: 1,     null: false, unsigned: true
    t.integer "article_datestamp",                    default: 0,     null: false, unsigned: true
    t.integer "article_reads",          limit: 3,     default: 0,                  unsigned: true
    t.boolean "article_allow_comments",               default: true,  null: false, unsigned: true
    t.boolean "article_allow_ratings",                default: true,  null: false, unsigned: true
    t.index ["article_cat"], name: "article_cat", using: :btree
    t.index ["article_datestamp"], name: "article_datestamp", using: :btree
    t.index ["article_reads"], name: "article_reads", using: :btree
  end

  create_table "fusion7_bbcodes", primary_key: "bbcode_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "bbcode_name",  limit: 20, default: "", null: false
    t.integer "bbcode_order", limit: 2,  default: 0,  null: false, unsigned: true
    t.index ["bbcode_order"], name: "bbcode_order", using: :btree
  end

  create_table "fusion7_blacklist", primary_key: "blacklist_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "blacklist_user_id",   limit: 3,     default: 0,    null: false, unsigned: true
    t.string  "blacklist_ip",        limit: 45,    default: "",   null: false
    t.boolean "blacklist_ip_type",                 default: true, null: false, unsigned: true
    t.string  "blacklist_email",     limit: 100,   default: "",   null: false
    t.text    "blacklist_reason",    limit: 65535,                null: false
    t.integer "blacklist_datestamp",               default: 0,    null: false, unsigned: true
    t.index ["blacklist_ip_type"], name: "blacklist_ip_type", using: :btree
  end

  create_table "fusion7_c2dm_devices", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string   "device_id",           default: "", null: false
    t.integer  "user_id",   limit: 2,              null: false, unsigned: true
    t.datetime "timestamp",                        null: false
    t.index ["user_id"], name: "USER", using: :btree
  end

  create_table "fusion7_c2dm_messages", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string   "author_id",     limit: 11, default: "", null: false
    t.string   "user_id",       limit: 11, default: "", null: false
    t.string   "message_type",  limit: 50,              null: false
    t.integer  "message_id",                            null: false
    t.string   "message_title",            default: "", null: false
    t.string   "message_text",             default: "", null: false
    t.datetime "timestamp",                             null: false
  end

  create_table "fusion7_captcha", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "captcha_datestamp",            default: 0,    null: false, unsigned: true
    t.string  "captcha_ip",        limit: 45, default: "",   null: false
    t.boolean "captcha_ip_type",              default: true, null: false, unsigned: true
    t.string  "captcha_encode",    limit: 32, default: "",   null: false
    t.string  "captcha_string",    limit: 15, default: "",   null: false
    t.index ["captcha_datestamp"], name: "captcha_datestamp", using: :btree
  end

  create_table "fusion7_ci_sessions", primary_key: "session_id", id: :string, limit: 40, default: "0", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "ip_address",    limit: 45,    default: "0", null: false
    t.string  "user_agent",    limit: 120,                 null: false
    t.integer "last_activity",               default: 0,   null: false, unsigned: true
    t.text    "user_data",     limit: 65535,               null: false
    t.index ["last_activity"], name: "last_activity_idx", using: :btree
  end

  create_table "fusion7_comments", primary_key: "comment_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "comment_item_id",   limit: 2,     default: 0,     null: false, unsigned: true
    t.string  "comment_type",      limit: 2,     default: "",    null: false
    t.string  "comment_name",      limit: 50,    default: "",    null: false
    t.text    "comment_message",   limit: 65535,                 null: false
    t.integer "comment_datestamp",               default: 0,     null: false, unsigned: true
    t.string  "comment_ip",        limit: 45,    default: "",    null: false
    t.boolean "comment_ip_type",                 default: true,  null: false, unsigned: true
    t.boolean "comment_hidden",                  default: false, null: false, unsigned: true
    t.index ["comment_datestamp"], name: "comment_datestamp", using: :btree
  end

  create_table "fusion7_custom_pages", primary_key: "page_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "page_title",          limit: 200,   default: "",    null: false
    t.integer "page_access",         limit: 1,     default: 0,     null: false, unsigned: true
    t.text    "page_content",        limit: 65535,                 null: false
    t.boolean "page_allow_comments",               default: false, null: false, unsigned: true
    t.boolean "page_allow_ratings",                default: false, null: false, unsigned: true
  end

  create_table "fusion7_download_cats", primary_key: "download_cat_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "download_cat_name",        limit: 100,   default: "",                   null: false
    t.text    "download_cat_description", limit: 65535,                                null: false
    t.string  "download_cat_sorting",     limit: 50,    default: "download_title ASC", null: false
    t.integer "download_cat_access",      limit: 1,     default: 0,                    null: false, unsigned: true
  end

  create_table "fusion7_downloads", primary_key: "download_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "download_user",              limit: 3,     default: 1,     null: false, unsigned: true
    t.string  "download_homepage",          limit: 100,   default: "",    null: false
    t.string  "download_title",             limit: 100,   default: "",    null: false
    t.string  "download_description_short", limit: 500,                   null: false
    t.text    "download_description",       limit: 65535,                 null: false
    t.string  "download_image",             limit: 100,   default: "",    null: false
    t.string  "download_image_thumb",       limit: 100,   default: "",    null: false
    t.string  "download_url",               limit: 200,   default: "",    null: false
    t.string  "download_file",              limit: 100,   default: "",    null: false
    t.integer "download_cat",               limit: 3,     default: 0,                  unsigned: true
    t.string  "download_license",           limit: 50,    default: "",    null: false
    t.string  "download_copyright",         limit: 250,   default: "",    null: false
    t.string  "download_os",                limit: 50,    default: "",    null: false
    t.string  "download_version",           limit: 20,    default: "",    null: false
    t.string  "download_filesize",          limit: 20,    default: "",    null: false
    t.integer "download_datestamp",                       default: 0,     null: false, unsigned: true
    t.integer "download_count",             limit: 2,     default: 0,     null: false, unsigned: true
    t.boolean "download_allow_comments",                  default: false, null: false, unsigned: true
    t.boolean "download_allow_ratings",                   default: false, null: false, unsigned: true
    t.index ["download_datestamp"], name: "download_datestamp", using: :btree
  end

  create_table "fusion7_email_verify", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id",        limit: 3,               null: false
    t.string  "user_code",      limit: 32,              null: false
    t.string  "user_email",     limit: 100,             null: false
    t.integer "user_datestamp",             default: 0, null: false, unsigned: true
    t.index ["user_datestamp"], name: "user_datestamp", using: :btree
  end

  create_table "fusion7_errors", primary_key: "error_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "error_level",        limit: 2,                     null: false, unsigned: true
    t.text    "error_message",      limit: 65535,                 null: false
    t.string  "error_file",         limit: 300,                   null: false
    t.integer "error_line",         limit: 2,                     null: false
    t.string  "error_page",         limit: 200,                   null: false
    t.integer "error_user_level",   limit: 2,                     null: false
    t.string  "error_user_ip",      limit: 45,    default: "",    null: false
    t.boolean "error_user_ip_type",               default: true,  null: false, unsigned: true
    t.boolean "error_status",                     default: false, null: false
    t.integer "error_timestamp",                                  null: false
  end

  create_table "fusion7_faq_cats", primary_key: "faq_cat_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "faq_cat_name",        limit: 200, default: "", null: false
    t.string "faq_cat_description", limit: 250, default: "", null: false
  end

  create_table "fusion7_faqs", primary_key: "faq_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "faq_cat_id",   limit: 3,     default: 0,               unsigned: true
    t.string  "faq_question", limit: 200,   default: "", null: false
    t.text    "faq_answer",   limit: 65535,              null: false
  end

  create_table "fusion7_fb_apply", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "apply_user",   limit: 3,     null: false
    t.integer "apply_group",  limit: 3,     null: false
    t.text    "apply_reason", limit: 65535, null: false
  end

  create_table "fusion7_fb_attachments", primary_key: "attach_id", id: :integer, limit: 3, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "attach_count", limit: 3, null: false
  end

  create_table "fusion7_fb_awards", primary_key: "award_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "award_user",  limit: 3,   null: false
    t.string  "award_image", limit: 200, null: false
    t.string  "award_desc",  limit: 200, null: false
  end

  create_table "fusion7_fb_bookmarks", primary_key: "bookmark_id", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "bookmark_name", limit: 200,   null: false
    t.string "bookmark_icon", limit: 200,   null: false
    t.text   "bookmark_url",  limit: 65535, null: false
  end

  create_table "fusion7_fb_buddies", primary_key: "buddy_id", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "buddy_user",     limit: 3, null: false
    t.integer "buddy_buddy",    limit: 3, null: false
    t.boolean "buddy_approved",           null: false
    t.integer "buddy_request",            null: false
    t.integer "buddy_added",              null: false
  end

  create_table "fusion7_fb_forum_notify", primary_key: "forum_id", id: :integer, limit: 3, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "notify_datestamp",                          null: false
    t.integer "notify_user",      limit: 3,                null: false
    t.boolean "notify_status",              default: true, null: false
  end

  create_table "fusion7_fb_forums", primary_key: "forum_id", id: :integer, limit: 3, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "forum_icon",      limit: 200,             null: false
    t.integer "forum_parent",    limit: 3,   default: 0, null: false
    t.boolean "forum_collapsed",                         null: false
  end

  create_table "fusion7_fb_groups", primary_key: "group_id", id: :integer, limit: 3, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "group_leader",      limit: 3,     null: false
    t.text    "group_officers",    limit: 65535
    t.boolean "group_access"
    t.boolean "group_visibility"
    t.boolean "group_wall"
    t.text    "group_description", limit: 65535
    t.text    "group_recentnews",  limit: 65535
    t.integer "group_created",                   null: false
    t.text    "group_image",       limit: 65535, null: false
    t.boolean "group_moderate",                  null: false
  end

  create_table "fusion7_fb_ignore", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "ignore_user",    limit: 3, null: false
    t.integer "ignore_ignored", limit: 3, null: false
  end

  create_table "fusion7_fb_invites", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "invite_to",    limit: 3, null: false
    t.integer "invite_from",  limit: 3, null: false
    t.integer "invite_group", limit: 3, null: false
  end

  create_table "fusion7_fb_labels", primary_key: "label_id", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "label_user",  limit: 3,     null: false
    t.integer "label_group", limit: 3,     null: false
    t.text    "label_style", limit: 65535, null: false
  end

  create_table "fusion7_fb_posts", primary_key: "post_id", id: :integer, limit: 3, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.text   "post_editreason", limit: 65535
    t.string "post_icon",       limit: 200,   null: false
  end

  create_table "fusion7_fb_rate", primary_key: "rate_id", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "rate_type", limit: 3, null: false
    t.integer "rate_user", limit: 3, null: false
    t.integer "rate_post", limit: 3, null: false
    t.integer "rate_by",   limit: 3, null: false
  end

  create_table "fusion7_fb_rate_type", primary_key: "type_id", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "type_name", limit: 200, null: false
    t.string "type_icon", limit: 200, null: false
  end

  create_table "fusion7_fb_settings", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.boolean "user_titles",                                             null: false
    t.boolean "user_titles_custom",                                      null: false
    t.integer "user_titles_custom_access", limit: 3,                     null: false
    t.boolean "user_titles_profile",                                     null: false
    t.boolean "user_titles_posts",                                       null: false
    t.boolean "forum_layout",                                            null: false
    t.integer "max_attach",                limit: 3,                     null: false
    t.boolean "layout_change",                                           null: false
    t.boolean "fboard_on",                                               null: false
    t.boolean "show_latest",                                             null: false
    t.boolean "latestno",                                                null: false
    t.boolean "latestscroll",                                            null: false
    t.boolean "spell_check",                                             null: false
    t.boolean "attach_count",                                            null: false
    t.boolean "latest_popup",                                            null: false
    t.integer "title_default",             limit: 3,                     null: false
    t.boolean "show_medals",                                             null: false
    t.boolean "post_icons",                                              null: false
    t.boolean "forum_icons",                                             null: false
    t.integer "threads_per_page",          limit: 2,                     null: false
    t.integer "posts_per_page",            limit: 2,                     null: false
    t.integer "avatar_max_h",              limit: 2,                     null: false
    t.integer "avatar_max_w",              limit: 2,                     null: false
    t.integer "avatar_max_size",                                         null: false
    t.integer "stat_moau",                 limit: 3,                     null: false
    t.integer "stat_today_date",                                         null: false
    t.text    "stat_today_users",          limit: 65535,                 null: false
    t.integer "stat_moau_date",                                          null: false
    t.boolean "stat_guests",                                             null: false
    t.boolean "show_ratings",                                            null: false
    t.float   "rating_opacity",            limit: 24,                    null: false
    t.boolean "award_alert",                                             null: false
    t.boolean "award_box",                                               null: false
    t.boolean "latest_post",                                             null: false
    t.boolean "subforum_view",                                           null: false
    t.boolean "announce_enable"
    t.integer "announce_create",           limit: 3
    t.integer "announce_reply",            limit: 3
    t.boolean "announce_polls"
    t.boolean "vb_nav",                                                  null: false
    t.text    "forum_rules",               limit: 65535,                 null: false
    t.boolean "forum_notify",                                            null: false
    t.integer "fn_access",                 limit: 3,                     null: false
    t.boolean "no_avatar",                                               null: false
    t.boolean "buttons",                                                 null: false
    t.boolean "buddy_enable",                            default: true,  null: false
    t.boolean "group_enable",                            default: true,  null: false
    t.integer "group_create",              limit: 3,     default: 101,   null: false
    t.boolean "stat_bday",                               default: true,  null: false
    t.boolean "stat_visitor",                            default: true,  null: false
    t.boolean "label_index",                                             null: false
    t.boolean "label_post",                                              null: false
    t.boolean "label_panel",                                             null: false
    t.boolean "w_see_own",                                               null: false
    t.text    "w_can_see",                 limit: 65535,                 null: false
    t.text    "w_can_give",                limit: 65535,                 null: false
    t.text    "w_protected",               limit: 65535,                 null: false
    t.boolean "w_enabled",                                               null: false
    t.boolean "boxover_ratings",                                         null: false
    t.boolean "show_ulevel",                                             null: false
    t.boolean "show_status",                                             null: false
    t.boolean "show_chat",                               default: false, null: false
  end

  create_table "fusion7_fb_threads", primary_key: "thread_id", id: :integer, limit: 3, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.boolean "thread_announcement", null: false
  end

  create_table "fusion7_fb_titles", primary_key: "title_id", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "title_title",  limit: 200,               null: false
    t.boolean "title_status",                           null: false
    t.integer "title_access", limit: 3,   default: 101, null: false
  end

  create_table "fusion7_fb_users", primary_key: "user_id", id: :integer, limit: 3, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.boolean "user_layout",                  null: false
    t.text    "user_notes",     limit: 65535, null: false
    t.boolean "user_warning",                 null: false
    t.boolean "user_invisible",               null: false
    t.integer "user_lv",                      null: false
    t.integer "user_banned",                  null: false
  end

  create_table "fusion7_fb_warn_rules", primary_key: "rule_level", id: :boolean, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.text    "rule_pm",      limit: 65535, null: false
    t.text    "rule_email",   limit: 65535, null: false
    t.integer "rule_bantime",               null: false
    t.boolean "rule_perma",                 null: false
  end

  create_table "fusion7_flood_control", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "flood_ip",        limit: 45, default: "",   null: false
    t.boolean "flood_ip_type",              default: true, null: false, unsigned: true
    t.integer "flood_timestamp",            default: 0,    null: false, unsigned: true
    t.index ["flood_timestamp"], name: "flood_timestamp", using: :btree
  end

  create_table "fusion7_forum_attachments", primary_key: "attach_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "thread_id",    limit: 3,   default: 0,               unsigned: true
    t.integer "post_id",      limit: 3,   default: 0,               unsigned: true
    t.string  "attach_name",  limit: 100, default: "", null: false
    t.string  "attach_ext",   limit: 5,   default: "", null: false
    t.integer "attach_size",              default: 0,  null: false, unsigned: true
    t.integer "attach_count",             default: 0,  null: false, unsigned: true
  end

  create_table "fusion7_forum_poll_options", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "thread_id",               limit: 3,   default: 0,  null: false, unsigned: true
    t.integer "forum_poll_option_id",    limit: 2,   default: 0,  null: false, unsigned: true
    t.string  "forum_poll_option_text",  limit: 150, default: "", null: false
    t.integer "forum_poll_option_votes", limit: 2,   default: 0,  null: false, unsigned: true
    t.index ["thread_id"], name: "thread_id", using: :btree
  end

  create_table "fusion7_forum_poll_voters", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "thread_id",               limit: 3,  default: 0,    null: false, unsigned: true
    t.integer "forum_vote_user_id",      limit: 3,  default: 0,    null: false, unsigned: true
    t.string  "forum_vote_user_ip",      limit: 45, default: "",   null: false
    t.boolean "forum_vote_user_ip_type",            default: true, null: false, unsigned: true
    t.index ["thread_id", "forum_vote_user_id"], name: "thread_id", using: :btree
  end

  create_table "fusion7_forum_polls", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "thread_id",         limit: 3,   default: 0,  null: false, unsigned: true
    t.string  "forum_poll_title",  limit: 250, default: "", null: false
    t.integer "forum_poll_start",                                        unsigned: true
    t.integer "forum_poll_length",             default: 0,  null: false, unsigned: true
    t.integer "forum_poll_votes",  limit: 2,   default: 0,  null: false, unsigned: true
    t.index ["thread_id"], name: "thread_id", using: :btree
  end

  create_table "fusion7_forum_ranks", primary_key: "rank_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "rank_title", limit: 100, default: "",    null: false
    t.string  "rank_image", limit: 100, default: "",    null: false
    t.integer "rank_posts",             default: 0,     null: false, unsigned: true
    t.boolean "rank_type",              default: false, null: false, unsigned: true
    t.integer "rank_apply", limit: 2,   default: 101,   null: false, unsigned: true
  end

  create_table "fusion7_forums", primary_key: "forum_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "forum_cat",             limit: 3,     default: 0,                  unsigned: true
    t.string  "forum_name",            limit: 100,   default: "",    null: false
    t.integer "forum_order",           limit: 2,     default: 0,     null: false, unsigned: true
    t.text    "forum_description",     limit: 65535,                 null: false
    t.text    "forum_moderators",      limit: 65535,                 null: false
    t.integer "forum_access",          limit: 1,     default: 0,     null: false, unsigned: true
    t.integer "forum_post",            limit: 2,     default: 101,                unsigned: true
    t.integer "forum_poll",            limit: 2,     default: 0,     null: false, unsigned: true
    t.integer "forum_vote",            limit: 2,     default: 0,     null: false, unsigned: true
    t.integer "forum_reply",           limit: 2,     default: 0,     null: false, unsigned: true
    t.integer "forum_attach",          limit: 2,     default: 0,     null: false, unsigned: true
    t.integer "forum_attach_download", limit: 2,     default: 0,     null: false, unsigned: true
    t.integer "forum_lastpost",                      default: 0,     null: false, unsigned: true
    t.integer "forum_postcount",       limit: 3,     default: 0,     null: false, unsigned: true
    t.integer "forum_threadcount",     limit: 3,     default: 0,     null: false, unsigned: true
    t.integer "forum_lastuser",        limit: 2,     default: 0,     null: false, unsigned: true
    t.boolean "forum_merge",                         default: false, null: false, unsigned: true
    t.index ["forum_lastpost"], name: "forum_lastpost", using: :btree
    t.index ["forum_order"], name: "forum_order", using: :btree
    t.index ["forum_postcount"], name: "forum_postcount", using: :btree
    t.index ["forum_threadcount"], name: "forum_threadcount", using: :btree
  end

  create_table "fusion7_infusions", primary_key: "inf_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "inf_title",   limit: 100, default: "",  null: false
    t.string "inf_folder",  limit: 100, default: "",  null: false
    t.string "inf_version", limit: 10,  default: "0", null: false
  end

  create_table "fusion7_messages", primary_key: "message_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "message_to",        limit: 3,     default: 0,                  unsigned: true
    t.integer "message_from",      limit: 3,     default: 0,                  unsigned: true
    t.string  "message_subject",   limit: 100,   default: "",    null: false
    t.text    "message_message",   limit: 65535,                 null: false
    t.string  "message_smileys",   limit: 1,     default: "",    null: false
    t.boolean "message_read",                    default: false, null: false, unsigned: true
    t.integer "message_datestamp",               default: 0,     null: false, unsigned: true
    t.boolean "message_folder",                  default: false, null: false, unsigned: true
    t.index ["message_datestamp"], name: "message_datestamp", using: :btree
  end

  create_table "fusion7_messages_options", primary_key: "user_id", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.boolean "pm_email_notify",           default: false, null: false, unsigned: true
    t.boolean "pm_save_sent",              default: false, null: false, unsigned: true
    t.integer "pm_inbox",        limit: 2, default: 0,     null: false, unsigned: true
    t.integer "pm_savebox",      limit: 2, default: 0,     null: false, unsigned: true
    t.integer "pm_sentbox",      limit: 2, default: 0,     null: false, unsigned: true
  end

  create_table "fusion7_missions", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "mission_name", limit: 50,    default: "",  null: false
    t.integer "creator",      limit: 2,     default: 0,   null: false, unsigned: true
    t.string  "type",         limit: 20,    default: "",  null: false
    t.string  "players",      limit: 10,    default: "",  null: false
    t.string  "map",          limit: 20,    default: "",  null: false
    t.text    "addons",       limit: 65535,               null: false
    t.string  "version",      limit: 10,    default: "1", null: false
    t.date    "date",                                     null: false
    t.string  "filename",     limit: 100,   default: "",  null: false
  end

  create_table "fusion7_new_users", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "user_code",      limit: 40,                 null: false
    t.string  "user_name",      limit: 30,                 null: false
    t.string  "user_email",     limit: 100,   default: "", null: false
    t.integer "user_datestamp",               default: 0,  null: false, unsigned: true
    t.text    "user_info",      limit: 65535,              null: false
    t.index ["user_datestamp"], name: "user_datestamp", using: :btree
  end

  create_table "fusion7_news", primary_key: "news_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "news_subject",        limit: 200,   default: "",    null: false
    t.integer "news_cat",            limit: 3,     default: 0,                  unsigned: true
    t.string  "news_image",          limit: 100,   default: "",    null: false
    t.string  "news_image_t1",       limit: 100,   default: "",    null: false
    t.string  "news_image_t2",       limit: 100,   default: "",    null: false
    t.text    "news_news",           limit: 65535,                 null: false
    t.text    "news_extended",       limit: 65535,                 null: false
    t.string  "news_breaks",         limit: 1,     default: "",    null: false
    t.integer "news_name",           limit: 2,     default: 1,     null: false, unsigned: true
    t.integer "news_datestamp",                    default: 0,     null: false, unsigned: true
    t.integer "news_start",                        default: 0,     null: false, unsigned: true
    t.integer "news_end",                          default: 0,     null: false, unsigned: true
    t.integer "news_visibility",     limit: 1,     default: 0,     null: false, unsigned: true
    t.integer "news_reads",          limit: 3,     default: 0,                  unsigned: true
    t.boolean "news_draft",                        default: false, null: false, unsigned: true
    t.boolean "news_sticky",                       default: false, null: false, unsigned: true
    t.boolean "news_allow_comments",               default: true,  null: false, unsigned: true
    t.boolean "news_allow_ratings",                default: true,  null: false, unsigned: true
    t.index ["news_datestamp"], name: "news_datestamp", using: :btree
    t.index ["news_reads"], name: "news_reads", using: :btree
  end

  create_table "fusion7_news_cats", primary_key: "news_cat_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "news_cat_name",  limit: 100, default: "", null: false
    t.string "news_cat_image", limit: 100, default: "", null: false
  end

  create_table "fusion7_online", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "online_user",       limit: 50, default: "",   null: false
    t.string  "online_ip",         limit: 45, default: "",   null: false
    t.boolean "online_ip_type",               default: true, null: false, unsigned: true
    t.integer "online_lastactive",            default: 0,    null: false, unsigned: true
  end

  create_table "fusion7_operations", primary_key: "operation_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer  "thread_id",                                                    unsigned: true
    t.string   "operation_title",                    default: "", null: false
    t.text     "operation_text",       limit: 65535
    t.string   "operation_image"
    t.datetime "operation_datetime",                              null: false
    t.integer  "operation_author",                                null: false
    t.integer  "operation_hidden",                   default: 1,  null: false
    t.integer  "operation_locked",                   default: 0,  null: false
    t.datetime "operation_updated_at",                            null: false
  end

  create_table "fusion7_operations_addons", primary_key: "addon_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "operation_id",                 null: false, unsigned: true
    t.string   "addon_name",       limit: 200
    t.string   "addon_url",        limit: 200
    t.datetime "addon_updated_at",             null: false
    t.index ["operation_id"], name: "operation_id", using: :btree
  end

  create_table "fusion7_operations_groups", primary_key: "group_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "operation_id",                              null: false, unsigned: true
    t.string   "group_title",      limit: 150, default: "", null: false
    t.integer  "group_order",                               null: false
    t.datetime "group_updated_at",                          null: false
    t.index ["operation_id"], name: "operation_id", using: :btree
  end

  create_table "fusion7_operations_pws", primary_key: "pws_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "operation_id",               null: false, unsigned: true
    t.string   "pws_name",       limit: 200
    t.datetime "pws_updated_at",             null: false
    t.index ["operation_id"], name: "operation_id", using: :btree
  end

  create_table "fusion7_operations_slots", primary_key: "slot_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "group_id",                                 null: false, unsigned: true
    t.string   "slot_title",      limit: 150, default: "", null: false
    t.integer  "user_id",                                               unsigned: true
    t.integer  "slot_order",                               null: false
    t.datetime "slot_updated_at",                          null: false
    t.index ["group_id"], name: "group_id", using: :btree
  end

  create_table "fusion7_panels", primary_key: "panel_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "panel_name",        limit: 100,   default: "",    null: false
    t.string  "panel_filename",    limit: 100,   default: "",    null: false
    t.text    "panel_content",     limit: 65535,                 null: false
    t.boolean "panel_side",                      default: true,  null: false, unsigned: true
    t.integer "panel_order",       limit: 2,     default: 0,     null: false, unsigned: true
    t.string  "panel_type",        limit: 20,    default: "",    null: false
    t.integer "panel_access",      limit: 1,     default: 0,     null: false, unsigned: true
    t.boolean "panel_display",                   default: false, null: false, unsigned: true
    t.boolean "panel_status",                    default: false, null: false, unsigned: true
    t.text    "panel_url_list",    limit: 65535,                 null: false
    t.boolean "panel_restriction",               default: false, null: false, unsigned: true
    t.index ["panel_order"], name: "panel_order", using: :btree
  end

  create_table "fusion7_pdp_cats", primary_key: "cat_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "top_cat",             limit: 2,  default: 0,          null: false, unsigned: true
    t.string  "cat_name",            limit: 50, default: "",         null: false
    t.string  "cat_desc",                       default: "",         null: false
    t.string  "cat_sorting",         limit: 50, default: "name ASC", null: false
    t.integer "cat_access",          limit: 1,  default: 0,          null: false, unsigned: true
    t.integer "cat_upload_access",   limit: 1,  default: 103,        null: false, unsigned: true
    t.integer "cat_download_access", limit: 1,  default: 0,          null: false, unsigned: true
    t.integer "cat_order",           limit: 2,  default: 0,          null: false, unsigned: true
    t.integer "count_downloads",                default: 0,          null: false, unsigned: true
  end

  create_table "fusion7_pdp_comments", primary_key: "comment_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "download_id",       limit: 2,     default: 0,         null: false, unsigned: true
    t.integer "user_id",           limit: 2,     default: 0,         null: false, unsigned: true
    t.string  "comment_user_name", limit: 50,    default: "",        null: false
    t.text    "comment_text",      limit: 65535,                     null: false
    t.integer "comment_timestamp",               default: 0,         null: false, unsigned: true
    t.string  "comment_ip",        limit: 20,    default: "0.0.0.0", null: false
    t.boolean "comment_smileys",                 default: true,      null: false, unsigned: true
    t.index ["download_id"], name: "download_id", using: :btree
  end

  create_table "fusion7_pdp_downloads", primary_key: "download_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "cat_id",            limit: 2,     default: 0,     null: false, unsigned: true
    t.integer "license_id",        limit: 2,     default: 0,     null: false, unsigned: true
    t.string  "dl_name",           limit: 100,   default: "",    null: false
    t.text    "dl_desc",           limit: 65535,                 null: false
    t.string  "dl_abstract",                     default: "",    null: false
    t.string  "dl_copyright",      limit: 200,   default: "",    null: false
    t.string  "lizenz_okay",       limit: 1,     default: "",    null: false
    t.string  "lizenz_packet",     limit: 1,     default: "",    null: false
    t.string  "lizenz_url",                      default: "",    null: false
    t.integer "dl_count",                        default: 0,     null: false
    t.integer "user_id",           limit: 2,     default: 0,     null: false, unsigned: true
    t.string  "hide_user",         limit: 3,     default: "no",  null: false
    t.integer "dl_ctime",                        default: 0,     null: false, unsigned: true
    t.integer "dl_mtime",                        default: 0,     null: false, unsigned: true
    t.string  "dl_homepage",                     default: "",    null: false
    t.string  "dl_status",         limit: 1,     default: "N",   null: false
    t.string  "down",                            default: "",    null: false
    t.string  "link_extern",                     default: "",    null: false
    t.string  "version",           limit: 20,    default: "",    null: false
    t.string  "dl_size",           limit: 20,    default: "",    null: false
    t.string  "dl_pic",                          default: "",    null: false
    t.boolean "dl_broken_count",                 default: false, null: false, unsigned: true
    t.integer "count_comments",                  default: 0,     null: false, unsigned: true
    t.integer "count_votes",                     default: 0,     null: false, unsigned: true
    t.integer "count_visitors",                  default: 0,     null: false, unsigned: true
    t.integer "count_subscribers",               default: 0,     null: false, unsigned: true
    t.float   "avg_vote",          limit: 24,    default: 0.0,   null: false, unsigned: true
    t.boolean "max_pics",                        default: true,  null: false
    t.string  "dir_files",                       default: "",    null: false
    t.index ["cat_id"], name: "cat_id", using: :btree
    t.index ["license_id"], name: "license_id", using: :btree
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "fusion7_pdp_files", primary_key: "file_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "download_id",    limit: 2,   default: 0,     null: false, unsigned: true
    t.string  "file_version",   limit: 20,  default: "",    null: false
    t.string  "file_desc",      limit: 100, default: "",    null: false
    t.string  "file_url",                   default: "",    null: false
    t.string  "file_size",      limit: 20,  default: "",    null: false
    t.integer "file_timestamp",             default: 0,     null: false, unsigned: true
    t.boolean "file_status",                default: false, null: false, unsigned: true
    t.integer "download_count",             default: 0,     null: false, unsigned: true
    t.index ["download_id"], name: "download_id", using: :btree
  end

  create_table "fusion7_pdp_images", primary_key: "pic_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "download_id", limit: 2,   default: 0,     null: false, unsigned: true
    t.string  "pic_desc",    limit: 100, default: "",    null: false
    t.string  "pic_url",                 default: "",    null: false
    t.boolean "pic_status",              default: false, null: false, unsigned: true
    t.index ["download_id"], name: "download_id", using: :btree
  end

  create_table "fusion7_pdp_licenses", primary_key: "license_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "license_name", limit: 100,   default: "", null: false
    t.text   "license_text", limit: 65535,              null: false
  end

  create_table "fusion7_pdp_log", primary_key: "log_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "download_id",   limit: 2, default: 0,     null: false, unsigned: true
    t.integer "user_id",       limit: 2, default: 0,     null: false, unsigned: true
    t.integer "log_timestamp",           default: 0,     null: false, unsigned: true
    t.boolean "log_type",                default: false, null: false, unsigned: true
    t.boolean "log_errno",               default: false, null: false, unsigned: true
    t.index ["download_id"], name: "download_id", using: :btree
  end

  create_table "fusion7_pdp_notify", primary_key: ["user_id", "download_id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id",     limit: 2, default: 0,     null: false, unsigned: true
    t.integer "download_id", limit: 2, default: 0,     null: false, unsigned: true
    t.string  "visited",     limit: 3, default: "yes", null: false
    t.integer "details",     limit: 1, default: 0,     null: false, unsigned: true
  end

  create_table "fusion7_pdp_settings", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "title",               limit: 100,   default: "Professional Download System",            null: false
    t.integer "neupm",               limit: 2,     default: 1,                                         null: false, unsigned: true
    t.integer "defektpm",            limit: 2,     default: 1,                                         null: false, unsigned: true
    t.string  "image_ext",           limit: 200,   default: "jpg,jpeg,gif,png",                        null: false
    t.string  "upload_image",        limit: 200,   default: "infusions/pro_download_panel/images/",    null: false
    t.integer "image_max",                         default: 1048576,                                   null: false, unsigned: true
    t.string  "file_ext",            limit: 200,   default: "zip,rar,tar,exe,tar.gz",                  null: false
    t.string  "upload_file",         limit: 200,   default: "infusions/pro_download_panel/downloads/", null: false
    t.integer "file_max",                          default: 2097152,                                   null: false, unsigned: true
    t.integer "downbereich",         limit: 1,     default: 101,                                       null: false, unsigned: true
    t.integer "uploadbereich",       limit: 1,     default: 103,                                       null: false, unsigned: true
    t.integer "kommentare",          limit: 1,     default: 101,                                       null: false, unsigned: true
    t.integer "bewertungen",         limit: 1,     default: 101,                                       null: false, unsigned: true
    t.integer "per_page",            limit: 1,     default: 10,                                        null: false, unsigned: true
    t.boolean "user_edit",                         default: false,                                     null: false, unsigned: true
    t.string  "hide_user_allow",     limit: 3,     default: "no",                                      null: false
    t.string  "version",             limit: 10,    default: "1.8.5",                                   null: false
    t.boolean "new_comm_pm",                       default: false,                                     null: false, unsigned: true
    t.boolean "hide_cats",                         default: false,                                     null: false, unsigned: true
    t.text    "broken_text",         limit: 65535,                                                     null: false
    t.boolean "broken_count",                      default: false,                                     null: false, unsigned: true
    t.integer "broken_access",       limit: 1,     default: 0,                                         null: false, unsigned: true
    t.text    "download_restricted", limit: 65535,                                                     null: false
    t.integer "profile_access",      limit: 1,     default: 101,                                                    unsigned: true
    t.boolean "new_days_long",                     default: false,                                     null: false, unsigned: true
    t.boolean "pm_after_changes",                  default: true,                                      null: false, unsigned: true
    t.boolean "do_log",                            default: true,                                      null: false, unsigned: true
    t.string  "theme",               limit: 50,    default: "",                                        null: false
    t.boolean "side_latest",                       default: true,                                      null: false, unsigned: true
    t.boolean "side_top",                          default: true,                                      null: false, unsigned: true
    t.integer "mod_grp",             limit: 1,     default: 103,                                       null: false, unsigned: true
    t.string  "need_verify",         limit: 3,     default: "yes",                                     null: false
    t.integer "image_max_w",         limit: 2,     default: 0,                                         null: false, unsigned: true
    t.integer "image_max_h",         limit: 2,     default: 0,                                         null: false, unsigned: true
    t.string  "image_scale",         limit: 3,     default: "no",                                      null: false
    t.string  "allow_notify",        limit: 3,     default: "no",                                      null: false
    t.boolean "default_max_pics",                  default: true,                                      null: false
  end

  create_table "fusion7_pdp_votes", primary_key: ["download_id", "user_id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "download_id", limit: 2, default: 0,     null: false, unsigned: true
    t.integer "user_id",     limit: 2, default: 0,     null: false, unsigned: true
    t.boolean "vote_opt",              default: false, null: false, unsigned: true
  end

  create_table "fusion7_photo_albums", primary_key: "album_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "album_title",       limit: 100,   default: "", null: false
    t.text    "album_description", limit: 65535,              null: false
    t.string  "album_thumb",       limit: 100,   default: "", null: false
    t.integer "album_user",        limit: 2,     default: 0,  null: false, unsigned: true
    t.integer "album_access",      limit: 2,     default: 0,  null: false, unsigned: true
    t.integer "album_order",       limit: 2,     default: 0,  null: false, unsigned: true
    t.integer "album_datestamp",                 default: 0,  null: false, unsigned: true
    t.index ["album_datestamp"], name: "album_datestamp", using: :btree
    t.index ["album_order"], name: "album_order", using: :btree
  end

  create_table "fusion7_photos", primary_key: "photo_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "album_id",             limit: 3,     default: 0,                 unsigned: true
    t.string  "photo_title",          limit: 100,   default: "",   null: false
    t.text    "photo_description",    limit: 65535,                null: false
    t.string  "photo_filename",       limit: 100,   default: "",   null: false
    t.string  "photo_thumb1",         limit: 100,   default: "",   null: false
    t.string  "photo_thumb2",         limit: 100,   default: "",   null: false
    t.integer "photo_datestamp",                    default: 0,    null: false, unsigned: true
    t.integer "photo_user",           limit: 2,     default: 0,    null: false, unsigned: true
    t.integer "photo_views",          limit: 2,     default: 0,    null: false, unsigned: true
    t.integer "photo_order",          limit: 2,     default: 0,    null: false, unsigned: true
    t.boolean "photo_allow_comments",               default: true, null: false, unsigned: true
    t.boolean "photo_allow_ratings",                default: true, null: false, unsigned: true
    t.index ["photo_datestamp"], name: "photo_datestamp", using: :btree
    t.index ["photo_order"], name: "photo_order", using: :btree
  end

  create_table "fusion7_poll_votes", primary_key: "vote_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "vote_user", limit: 2, default: 0, null: false, unsigned: true
    t.integer "vote_opt",  limit: 2, default: 0, null: false, unsigned: true
    t.integer "poll_id",   limit: 3, default: 0,              unsigned: true
  end

  create_table "fusion7_polls", primary_key: "poll_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "poll_title",   limit: 200, default: "", null: false
    t.string  "poll_opt_0",   limit: 200, default: "", null: false
    t.string  "poll_opt_1",   limit: 200, default: "", null: false
    t.string  "poll_opt_2",   limit: 200, default: "", null: false
    t.string  "poll_opt_3",   limit: 200, default: "", null: false
    t.string  "poll_opt_4",   limit: 200, default: "", null: false
    t.string  "poll_opt_5",   limit: 200, default: "", null: false
    t.string  "poll_opt_6",   limit: 200, default: "", null: false
    t.string  "poll_opt_7",   limit: 200, default: "", null: false
    t.string  "poll_opt_8",   limit: 200, default: "", null: false
    t.string  "poll_opt_9",   limit: 200, default: "", null: false
    t.integer "poll_started",             default: 0,  null: false, unsigned: true
    t.integer "poll_ended",               default: 0,  null: false, unsigned: true
  end

  create_table "fusion7_posts", primary_key: "post_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "forum_id",        limit: 3,     default: 0,                  unsigned: true
    t.integer "thread_id",       limit: 3,     default: 0,                  unsigned: true
    t.text    "post_message",    limit: 65535,                 null: false
    t.boolean "post_showsig",                  default: false, null: false, unsigned: true
    t.boolean "post_smileys",                  default: true,  null: false, unsigned: true
    t.integer "post_author",     limit: 2,     default: 0,     null: false, unsigned: true
    t.integer "post_datestamp",                default: 0,     null: false, unsigned: true
    t.string  "post_ip",         limit: 45,    default: "",    null: false
    t.boolean "post_ip_type",                  default: true,  null: false, unsigned: true
    t.integer "post_edituser",   limit: 2,     default: 0,     null: false, unsigned: true
    t.integer "post_edittime",                 default: 0,     null: false, unsigned: true
    t.text    "post_editreason", limit: 65535,                 null: false
    t.boolean "post_hidden",                   default: false, null: false, unsigned: true
    t.boolean "post_locked",                   default: false, null: false, unsigned: true
    t.index ["post_datestamp"], name: "post_datestamp", using: :btree
    t.index ["post_datestamp"], name: "post_datestamp_2", using: :btree
    t.index ["thread_id"], name: "thread_id", using: :btree
  end

  create_table "fusion7_ratings", primary_key: "rating_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "rating_item_id",   limit: 3,  default: 0,                  unsigned: true
    t.string  "rating_type",      limit: 1,  default: "",    null: false
    t.integer "rating_user",      limit: 2,  default: 0,     null: false, unsigned: true
    t.boolean "rating_vote",                 default: false, null: false, unsigned: true
    t.integer "rating_datestamp",            default: 0,     null: false, unsigned: true
    t.string  "rating_ip",        limit: 45, default: "",    null: false
    t.boolean "rating_ip_type",              default: true,  null: false, unsigned: true
  end

  create_table "fusion7_settings", primary_key: "settings_name", id: :string, limit: 200, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.text "settings_value", limit: 65535, null: false
  end

  create_table "fusion7_settings_inf", primary_key: "settings_name", id: :string, limit: 200, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.text   "settings_value", limit: 65535,              null: false
    t.string "settings_inf",   limit: 200,   default: "", null: false
  end

  create_table "fusion7_shoutbox", primary_key: "shout_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "shout_name",      limit: 50, default: "",    null: false
    t.string  "shout_message",              default: "",    null: false
    t.integer "shout_datestamp",            default: 0,     null: false, unsigned: true
    t.string  "shout_ip",        limit: 45, default: "",    null: false
    t.boolean "shout_ip_type",              default: true,  null: false, unsigned: true
    t.boolean "shout_hidden",               default: false, null: false, unsigned: true
    t.index ["shout_datestamp"], name: "shout_datestamp", using: :btree
  end

  create_table "fusion7_site_links", primary_key: "link_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "link_name",       limit: 100, default: "",    null: false
    t.string  "link_url",        limit: 200, default: "",    null: false
    t.integer "link_visibility", limit: 1,   default: 0,     null: false, unsigned: true
    t.boolean "link_position",               default: true,  null: false, unsigned: true
    t.boolean "link_window",                 default: false, null: false, unsigned: true
    t.integer "link_order",      limit: 2,   default: 0,     null: false, unsigned: true
  end

  create_table "fusion7_sitemapxml", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "update_interval",         limit: 3,   default: 86400, null: false, unsigned: true
    t.string  "site_url",                limit: 200, default: "",    null: false
    t.boolean "news_enabled",                        default: true,  null: false, unsigned: true
    t.boolean "news_changefreq",                     default: false, null: false, unsigned: true
    t.string  "news_priority",           limit: 3,   default: "0.6", null: false
    t.boolean "newscats_enabled",                    default: true,  null: false, unsigned: true
    t.boolean "newscats_changefreq",                 default: true,  null: false, unsigned: true
    t.string  "newscats_priority",       limit: 3,   default: "0.2", null: false
    t.boolean "articlecats_enabled",                 default: true,  null: false, unsigned: true
    t.boolean "articlecats_changefreq",              default: false, null: false, unsigned: true
    t.string  "articlecats_priority",    limit: 3,   default: "0.2", null: false
    t.boolean "articles_enabled",                    default: true,  null: false, unsigned: true
    t.boolean "articles_changefreq",                 default: true,  null: false, unsigned: true
    t.string  "articles_priority",       limit: 3,   default: "0.5", null: false
    t.boolean "profiles_enabled",                    default: true,  null: false, unsigned: true
    t.boolean "profiles_changefreq",                 default: true,  null: false, unsigned: true
    t.string  "profiles_priority",       limit: 3,   default: "0.1", null: false
    t.boolean "photoalbums_enabled",                 default: true,  null: false, unsigned: true
    t.boolean "photoalbums_changefreq",              default: false, null: false, unsigned: true
    t.string  "photoalbums_priority",    limit: 3,   default: "0.2", null: false
    t.boolean "photos_enabled",                      default: true,  null: false, unsigned: true
    t.boolean "photos_changefreq",                   default: false, null: false, unsigned: true
    t.string  "photos_priority",         limit: 3,   default: "0.3", null: false
    t.boolean "custompages_enabled",                 default: true,  null: false, unsigned: true
    t.boolean "custompages_changefreq",              default: true,  null: false, unsigned: true
    t.string  "custompages_priority",    limit: 3,   default: "0.3", null: false
    t.boolean "faqcats_enabled",                     default: true,  null: false, unsigned: true
    t.boolean "faqcats_changefreq",                  default: true,  null: false, unsigned: true
    t.string  "faqcats_priority",        limit: 3,   default: "0.3", null: false
    t.boolean "downloadcats_enabled",                default: true,  null: false, unsigned: true
    t.boolean "downloadcats_changefreq",             default: true,  null: false, unsigned: true
    t.string  "downloadcats_priority",   limit: 3,   default: "0.3", null: false
    t.boolean "downloads_enabled",                   default: true,  null: false, unsigned: true
    t.boolean "downloads_changefreq",                default: true,  null: false, unsigned: true
    t.string  "downloads_priority",      limit: 3,   default: "0.4", null: false
    t.boolean "weblinkcats_enabled",                 default: true,  null: false, unsigned: true
    t.boolean "weblinkcats_changefreq",              default: true,  null: false, unsigned: true
    t.string  "weblinkcats_priority",    limit: 3,   default: "0.3", null: false
    t.boolean "forums_enabled",                      default: true,  null: false, unsigned: true
    t.boolean "forums_changefreq",                   default: true,  null: false, unsigned: true
    t.string  "forums_priority",         limit: 3,   default: "0.4", null: false
    t.boolean "threads_enabled",                     default: true,  null: false, unsigned: true
    t.boolean "threads_changefreq",                  default: false, null: false, unsigned: true
    t.string  "threads_priority",        limit: 3,   default: "0.6", null: false
    t.integer "threads_limit",           limit: 3,   default: 0,     null: false, unsigned: true
    t.boolean "kroaxcats_enabled",                   default: false, null: false, unsigned: true
    t.boolean "kroaxcats_changefreq",                default: false, null: false, unsigned: true
    t.string  "kroaxcats_priority",      limit: 3,   default: "0.1", null: false
    t.boolean "kroaxvideos_enabled",                 default: false, null: false, unsigned: true
    t.boolean "kroaxvideos_changefreq",              default: false, null: false, unsigned: true
    t.string  "kroaxvideos_priority",    limit: 3,   default: "0.3", null: false
    t.boolean "varcadecats_enabled",                 default: false, null: false, unsigned: true
    t.boolean "varcadecats_changefreq",              default: true,  null: false, unsigned: true
    t.string  "varcadecats_priority",    limit: 3,   default: "0.3", null: false
    t.boolean "varcadegames_enabled",                default: false, null: false, unsigned: true
    t.boolean "varcadegames_changefreq",             default: true,  null: false, unsigned: true
    t.string  "varcadegames_priority",   limit: 3,   default: "0.3", null: false
    t.boolean "pdpcats_enabled",                     default: false, null: false, unsigned: true
    t.boolean "pdpcats_changefreq",                  default: true,  null: false, unsigned: true
    t.string  "pdpcats_priority",        limit: 3,   default: "0.2", null: false
    t.boolean "pdpdownloads_enabled",                default: false, null: false, unsigned: true
    t.boolean "pdpdownloads_changefreq",             default: true,  null: false, unsigned: true
    t.string  "pdpdownloads_priority",   limit: 3,   default: "0.3", null: false
    t.boolean "tiblogsystem_enabled",                default: false, null: false, unsigned: true
    t.boolean "tiblogsystem_changefreq",             default: true,  null: false, unsigned: true
    t.string  "tiblogsystem_priority",   limit: 3,   default: "0.3", null: false
  end

  create_table "fusion7_sitemapxml_customlinks", primary_key: "link_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.text    "link_url",       limit: 65535,                 null: false
    t.boolean "link_frequency",               default: true,  null: false, unsigned: true
    t.string  "link_priority",  limit: 3,     default: "0.4", null: false
  end

  create_table "fusion7_smileys", primary_key: "smiley_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "smiley_code",  limit: 50,  default: "", null: false
    t.string "smiley_image", limit: 100, default: "", null: false
    t.string "smiley_text",  limit: 100, default: "", null: false
  end

  create_table "fusion7_submissions", primary_key: "submit_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "submit_type",      limit: 1,     default: "", null: false
    t.integer "submit_user",      limit: 3,     default: 0,               unsigned: true
    t.integer "submit_datestamp",               default: 0,  null: false, unsigned: true
    t.text    "submit_criteria",  limit: 65535,              null: false
  end

  create_table "fusion7_suspends", primary_key: "suspend_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "suspended_user",    limit: 3,                     null: false, unsigned: true
    t.integer "suspending_admin",  limit: 3,     default: 1,     null: false, unsigned: true
    t.string  "suspend_ip",        limit: 45,    default: "",    null: false
    t.boolean "suspend_ip_type",                 default: true,  null: false, unsigned: true
    t.integer "suspend_date",                    default: 0,     null: false
    t.text    "suspend_reason",    limit: 65535,                 null: false
    t.boolean "suspend_type",                    default: false, null: false
    t.integer "reinstating_admin", limit: 3,     default: 1,     null: false, unsigned: true
    t.text    "reinstate_reason",  limit: 65535,                 null: false
    t.integer "reinstate_date",                  default: 0,     null: false
    t.string  "reinstate_ip",      limit: 45,    default: "",    null: false
    t.boolean "reinstate_ip_type",               default: true,  null: false, unsigned: true
  end

  create_table "fusion7_thread_notify", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "thread_id",        limit: 3, default: 0,                 unsigned: true
    t.integer "notify_datestamp",           default: 0,    null: false, unsigned: true
    t.integer "notify_user",      limit: 3, default: 0,                 unsigned: true
    t.boolean "notify_status",              default: true, null: false, unsigned: true
    t.index ["notify_datestamp"], name: "notify_datestamp", using: :btree
  end

  create_table "fusion7_threads", primary_key: "thread_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "forum_id",          limit: 2,   default: 0,     null: false, unsigned: true
    t.string  "thread_subject",    limit: 100, default: "",    null: false
    t.integer "thread_author",     limit: 2,   default: 0,     null: false, unsigned: true
    t.integer "thread_views",      limit: 2,   default: 0,     null: false, unsigned: true
    t.integer "thread_lastpost",               default: 0,     null: false, unsigned: true
    t.integer "thread_lastpostid", limit: 3,   default: 0,     null: false, unsigned: true
    t.integer "thread_postcount",  limit: 2,   default: 0,     null: false, unsigned: true
    t.integer "thread_lastuser",   limit: 2,   default: 0,     null: false, unsigned: true
    t.boolean "thread_poll",                   default: false, null: false, unsigned: true
    t.boolean "thread_sticky",                 default: false, null: false, unsigned: true
    t.boolean "thread_locked",                 default: false, null: false, unsigned: true
    t.boolean "thread_hidden",                 default: false, null: false, unsigned: true
    t.index ["thread_lastpost"], name: "thread_lastpost", using: :btree
    t.index ["thread_postcount"], name: "thread_postcount", using: :btree
    t.index ["thread_views"], name: "thread_views", using: :btree
  end

  create_table "fusion7_user_field_cats", primary_key: "field_cat_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "field_cat_name",  limit: 200, null: false
    t.integer "field_cat_order", limit: 2,   null: false, unsigned: true
  end

  create_table "fusion7_user_fields", primary_key: "field_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "field_name",         limit: 50, default: "",    null: false
    t.integer "field_cat",          limit: 3,  default: 1,                  unsigned: true
    t.boolean "field_required",                default: false, null: false, unsigned: true
    t.boolean "field_log",                     default: false, null: false, unsigned: true
    t.boolean "field_registration",            default: false, null: false, unsigned: true
    t.integer "field_order",        limit: 2,  default: 0,     null: false, unsigned: true
    t.index ["field_order"], name: "field_order", using: :btree
  end

  create_table "fusion7_user_groups", primary_key: "group_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "group_name",        limit: 100, default: "", null: false
    t.string "group_description", limit: 200, default: "", null: false
  end

  create_table "fusion7_user_log", primary_key: "userlog_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "userlog_user_id",   limit: 3,     default: 0,  null: false, unsigned: true
    t.string  "userlog_field",     limit: 50,    default: "", null: false
    t.text    "userlog_value_new", limit: 65535,              null: false
    t.text    "userlog_value_old", limit: 65535,              null: false
    t.integer "userlog_timestamp",               default: 0,  null: false, unsigned: true
    t.index ["userlog_field"], name: "userlog_field", using: :btree
    t.index ["userlog_user_id"], name: "userlog_user_id", using: :btree
  end

  create_table "fusion7_users", primary_key: "user_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "user_name",           limit: 30,    default: "",        null: false
    t.string  "user_algo",           limit: 10,    default: "md5",     null: false
    t.string  "user_salt",           limit: 40,                        null: false
    t.string  "user_password",       limit: 64,                        null: false
    t.string  "user_admin_algo",     limit: 10,    default: "md5",     null: false
    t.string  "user_admin_salt",     limit: 40,                        null: false
    t.string  "user_admin_password", limit: 64,                        null: false
    t.string  "user_email",          limit: 100,   default: "",        null: false
    t.boolean "user_hide_email",                   default: true,      null: false, unsigned: true
    t.string  "user_location",       limit: 50,    default: "",        null: false
    t.date    "user_birthdate",                                        null: false
    t.string  "user_aim",            limit: 16,    default: "",        null: false
    t.string  "user_icq",            limit: 15,    default: "",        null: false
    t.string  "user_msn",            limit: 100,   default: "",        null: false
    t.string  "user_yahoo",          limit: 100,   default: "",        null: false
    t.string  "user_web",            limit: 200,   default: "",        null: false
    t.string  "user_theme",          limit: 100,   default: "Default", null: false
    t.string  "user_offset",         limit: 5,     default: "0"
    t.string  "user_avatar",         limit: 100,   default: "",        null: false
    t.text    "user_sig",            limit: 65535,                     null: false
    t.integer "user_posts",          limit: 2,     default: 0,         null: false, unsigned: true
    t.text    "user_threads",        limit: 65535,                     null: false
    t.integer "user_joined",                       default: 0,         null: false, unsigned: true
    t.integer "user_lastvisit",                    default: 0,         null: false, unsigned: true
    t.string  "user_ip",             limit: 45,    default: "0.0.0.0", null: false
    t.boolean "user_ip_type",                      default: true,      null: false, unsigned: true
    t.text    "user_rights",         limit: 65535,                     null: false
    t.text    "user_groups",         limit: 65535,                     null: false
    t.integer "user_level",          limit: 1,     default: 101,       null: false, unsigned: true
    t.boolean "user_status",                       default: false,     null: false, unsigned: true
    t.integer "user_actiontime",                   default: 0,         null: false, unsigned: true
    t.string  "user_arma2_id",       limit: 20,    default: "",        null: false
    t.string  "user_arma2_nick",     limit: 50,    default: "",        null: false
    t.string  "user_bf3",            limit: 50,    default: "",        null: false
    t.string  "user_arma3_id",       limit: 20,    default: "",        null: false
    t.string  "user_arma3_nick",     limit: 50,    default: "",        null: false
    t.string  "user_twitch"
    t.index ["user_joined"], name: "user_joined", using: :btree
    t.index ["user_lastvisit"], name: "user_lastvisit", using: :btree
    t.index ["user_name"], name: "user_name", using: :btree
  end

  create_table "fusion7_weblink_cats", primary_key: "weblink_cat_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "weblink_cat_name",        limit: 100,   default: "",                 null: false
    t.text    "weblink_cat_description", limit: 65535,                              null: false
    t.string  "weblink_cat_sorting",     limit: 50,    default: "weblink_name ASC", null: false
    t.integer "weblink_cat_access",      limit: 1,     default: 0,                  null: false, unsigned: true
  end

  create_table "fusion7_weblinks", primary_key: "weblink_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string  "weblink_name",        limit: 100,   default: "", null: false
    t.text    "weblink_description", limit: 65535,              null: false
    t.string  "weblink_url",         limit: 200,   default: "", null: false
    t.integer "weblink_cat",         limit: 3,     default: 0,               unsigned: true
    t.integer "weblink_datestamp",                 default: 0,  null: false, unsigned: true
    t.integer "weblink_count",       limit: 2,     default: 0,  null: false, unsigned: true
    t.index ["weblink_count"], name: "weblink_count", using: :btree
    t.index ["weblink_datestamp"], name: "weblink_datestamp", using: :btree
  end

end
