class CreateInquiries < ActiveRecord::Migration[7.2]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :business_name
      t.integer :quantity
      t.date :date_needed
      t.string :apparel_type
      t.text :questions

      t.timestamps
    end
  end
end
