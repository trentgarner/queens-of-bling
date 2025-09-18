class CreateModelApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :model_applications do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.text :notes

      t.timestamps
    end
  end
end
