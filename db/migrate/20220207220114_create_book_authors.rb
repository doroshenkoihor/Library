class CreateBookAuthors < ActiveRecord::Migration[6.0]
  def self.up
    create_table :book_authors do |t|
      t.references :book, index: true
      t.references :author, index: true
    end
  end

  def self.down
    drop_table :book_authors do |t|
      t.remove_references :book, index: true
      t.remove_references :author, index: true
    end
end
end