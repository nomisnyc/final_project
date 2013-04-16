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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130414193527) do

  create_table "answers", :force => true do |t|
    t.text     "text"
    t.boolean  "is_correct"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "assignments", :force => true do |t|
    t.string   "description"
    t.string   "subject"
    t.string   "source_type"
    t.string   "source_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "classrooms", :force => true do |t|
    t.string   "subject"
    t.integer  "teacher_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "classrooms_users", :id => false, :force => true do |t|
    t.integer "classroom_id"
    t.integer "user_id"
  end

  create_table "homeworks", :force => true do |t|
    t.text    "instruction"
    t.integer "user_id"
    t.integer "classroom_id"
    t.string  "grade"
    t.date    "due_date"
  end

  create_table "homeworks_questions", :id => false, :force => true do |t|
    t.integer "homework_id"
    t.integer "question_id"
  end

  create_table "questions", :force => true do |t|
    t.string   "text"
    t.integer  "assignment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "questions_tags", :id => false, :force => true do |t|
    t.integer "qustion_id"
    t.integer "tag_id"
  end

  create_table "responses", :force => true do |t|
    t.string   "answer"
    t.boolean  "is_correct"
    t.integer  "homework_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "is_teacher"
    t.string   "password_digest"
    t.text     "address"
    t.string   "phone"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
