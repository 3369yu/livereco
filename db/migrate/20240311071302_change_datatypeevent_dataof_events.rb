class ChangeDatatypeeventDataofEvents < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :event_data, :datetime
  end
end
