class RemoveAuthorNameFromComment < ActiveRecord::Migration
  def change
    remove_column :comments, :author_name
  end
end
