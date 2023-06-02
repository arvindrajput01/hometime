class CreateGuests < ActiveRecord::Migration[7.0]
  def up
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email , :unique => true, :required => true
      t.string :phone

      t.timestamps
    end
  end

  def down
    drop_table :guests
  end
end
