class AddAuthorToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :author, index: true, foreign_key: true
  end
end
