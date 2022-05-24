class Genres < ActiveRecord::Migration[6.0]
  def self.up

    create_table :genres do |t|
      t.column :name, :string
    end

    Genre.create :name => "Physics"
    Genre.create :name => "Mathematics"
    Genre.create :name => "Chemistry"
    Genre.create :name => "Psychology"
    Genre.create :name => "Geography"
  end

  def self.down
    drop_table :genres
  end
end
