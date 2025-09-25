class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.integer :rating
      t.text :content
      t.boolean :approved

      t.timestamps
    end
  end
end
