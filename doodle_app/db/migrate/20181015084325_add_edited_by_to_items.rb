class AddEditedByToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :last_edited_by, :user
  end
end
