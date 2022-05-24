class Authors < ActiveRecord::Migration[6.0]
  def self.up
    create_table :authors do |t|
      t.column :name, :string, :null => false
    end

    Author.create :name => "Stephen King"
    Author.create :name => "Mark Tvain"
    Author.create :name => "William Faulkner"
    Author.create :name => "Jack London"
    Author.create :name => "Harpep Lee"
    Author.create :name => "Charles Bukowski"
    Author.create :name => "Richard Bach"
    Author.create :name => "Stephen Crane"
  end

  def self.down
    drop_table :authors
  end
end
