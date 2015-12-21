# Model proxy betwen article and tags
class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :article
end
