# Article model
class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :author
  has_attached_file :image, styles: { medium: '300x300', thumb: '100x100' }
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  validates :title, presence: true
  scope :commented,  -> { left_join(:comments) }


  def tag_list
    tags.join(', ')
  end

  def tag_list=(tags_string)
    self.tags = TagService.new.find_or_create_by_tags_string(tags_string)
  end


end


