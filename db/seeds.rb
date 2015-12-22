tags_name = Faker::Hipster.words(6)

author = Author.create(
    username: 'piotr',
    email: 'galaspiotrek@gmail.com',
    password: 'password',
    created_at: Faker::Time.backward(14, :evening)
)

25.times do


  article = Article.create(
    title:      Faker::Book.title,
    body:       Faker::Lorem.paragraph(2),
    created_at: Faker::Time.backward(14, :evening),
    author_id:  author.id
  )


  4.times do
    article.tags << Tag.find_or_create_by(name: tags_name.sample)
  end

  2.times do
    article.comments.create(
      author_name:  Faker::Name.name,
      body:         Faker::Lorem.sentences(1),
      created_at:   Faker::Time.backward(14, :evening),
      author_id:  author.id
    )
  end
end