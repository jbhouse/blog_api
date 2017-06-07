class RenameCategoriesToBooks < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :categories, :books
  end

  def self.down
    rename_table :books, :categories
  end
end
