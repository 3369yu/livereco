class RenameStartColumsToEvents < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :start, :curtain
  end
end
