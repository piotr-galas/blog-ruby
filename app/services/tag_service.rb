# tag service
class TagService
  def find_or_create_by_tags_string(tags_string)
    tag_names(tags_string).collect { |name| Tag.find_or_create_by(name: name) }
  end

  private

  def tag_names(tags_string)
    tags_string.split(',').collect { |name| name.strip.downcase }.uniq
  end
end
