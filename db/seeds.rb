# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  # create_table "articles", force: :cascade do |t|
  #   t.string   "title"
  #   t.text     "body"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end

  # create_table "comments", force: :cascade do |t|
  #   t.string   "author_name"
  #   t.text     "body"
  #   t.integer  "article_id"
  #   t.datetime "created_at",  null: false
  #   t.datetime "updated_at",  null: false
  # end

  # add_index "comments", ["article_id"], name: "index_comments_on_article_id"

  # create_table "taggings", force: :cascade do |t|
  #   t.integer  "tag_id"
  #   t.integer  "article_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end

  # add_index "taggings", ["article_id"], name: "index_taggings_on_article_id"
  # add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  # create_table "tags", force: :cascade do |t|
  #   t.string   "name"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false

tags_name = Faker::Hipster.words(6)


25.times do
  article = Article.create(
    :title      => Faker::Book.title,
    :body       => Faker::Lorem.paragraph(2),
    :created_at => Faker::Time.backward(14, :evening)
  )

  4.times do
    article.tags << Tag.find_or_create_by(name: tags_name.sample)
  end

  2.times do
    article.comments.create(
      :author_name => Faker::Name.name,
      :body        => Faker::Lorem.sentences(1),
      :created_at => Faker::Time.backward(14, :evening)
    )
  end
end