class Books < ActiveRecord::Migration[6.0]
    def self.up
    create_table :books do |t|
      t.column :name, :string, :null => false
      t.column :genre_id, :integer
    end
  end

  def self.down
    drop_table :books
  end
end
