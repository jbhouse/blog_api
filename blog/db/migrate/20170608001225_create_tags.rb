class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :title

      t.timestamps
    end

    create_table :books_tags, id: false do |t|
      t.belongs_to :book, index: true
      t.belongs_to :tag, index: true
    end
  end
end
