class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.integer :target_id
      t.string :target_type
      t.text :body

      t.timestamps
    end
  end
end
