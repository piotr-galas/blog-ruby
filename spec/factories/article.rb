FactoryGirl.define do
  factory :article do
    title 'sample'

    factory :article_with_one_comment do
      after(:create) do |article|
        create(:comment, article: article)
      end
    end

    factory :article_with_two_comment do
      after(:create) do |article|
        create(:comment, article: article)
        create(:comment, article: article)
      end
    end

    factory :article_with_three_comment do
      after(:create) do |article|
        create(:comment, article: article)
        create(:comment, article: article)
        create(:comment, article: article)
      end
    end
  end

  factory :comment do
    body 'Great article!'
  end
end
