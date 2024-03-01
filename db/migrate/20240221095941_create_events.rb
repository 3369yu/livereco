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
      t.integer :buy
      t.string :seet
      t.string :transportation
      t.string :stay
      t.text :impression
      t.text :setlist
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
