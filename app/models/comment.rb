# Comment for article
class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :author
end
