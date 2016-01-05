# Article model
class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :author
  has_attached_file :image, styles: { medium: '300x300', thumb: '100x100' }
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  validates :title, presence: true
  scope :commented,  -> { left_join(:comments).group('articles.id')}
  scope :count_comment, -> { select('articles.*, count(DISTINCT comments.id) as comment_count')
                            .left_join(:comments)
                            .group('articles.id') }
  scope :comments_number, ->(comments_number) { having("comment_count = #{comments_number}") }
  scope :tags_number, ->(tags_number){ select('count(DISTINCT taggings.id) as taggins_count')
                                       .left_join(:taggings)
                                       .having("taggins_count = #{tags_number}") }

  def tag_list
    tags.join(', ')
  end

  def tag_list=(tags_string)
    self.tags = TagService.new.find_or_create_by_tags_string(tags_string)
  end
end


