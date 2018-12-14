class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :content
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
