class RenameEventDataColumsToEvents < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :event_data, :start
  end
end
