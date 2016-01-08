# filter article
class FilterArticleService < FilterService
  attr_accessor :comments_number, :tags_number, :comented
  validates :comments_number, numericality: true
  validates :tags_number, numericality: true

  def self.comments_number(articles, comments_number_value)
    articles.having("comment_count = #{comments_number_value}")
  end

  def self.comented(articles, _filter_value)
    articles.joins(:comments)
  end

  def self.tags_number(articles, tags_number_value)
    articles
      .select('count(DISTINCT taggings.id) as taggins_count')
      .left_join(:taggings)
      .having("taggins_count = #{tags_number_value}")
  end

  protected

  def clean_params(params)
    params.slice(:comments_number, :tags_number, :comented)
  end
end
