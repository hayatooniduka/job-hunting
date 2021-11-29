class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :founded
      t.string :philosophy
      t.string :number
      t.text :content
      t.string :time
      t.string :rival
      t.string :remarks
      
      t.references :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
