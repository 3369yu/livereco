class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      
      t.integer :user_id, null: false
      t.string :name, null: false
      t.date :event_data, null: false
      t.string :place
      t.string :open
      t.string :start
      t.string :title
      t.string :price
      t.string :buy
      t.string :seet
      t.string :transportation
      t.string :stay
      t.text :impression
      t.text :setlist
      t.boolean :is_active, null: false, default: "false"

      t.timestamps
    end
  end
end
