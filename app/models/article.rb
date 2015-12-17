class Article < ActiveRecord::Base
	has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ['image/jpg','image/jpeg', 'image/png']

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    self.tags = TagService.new.find_or_create_by_tags_string(tags_string)
  end

end
