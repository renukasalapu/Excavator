class CreateExcavators < ActiveRecord::Migration[7.0]
  def change
    create_table :excavators do |t|
      t.string :company_name
      t.string :address
      t.string :crew_on_site
      t.integer :ticket_id

      t.timestamps
    end
  end
end
