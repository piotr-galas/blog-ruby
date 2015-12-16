class Article < ActiveRecord::Base
	has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    self.tags = TagService.new.find_or_create_by_tags_string(tags_string)
  end

end
