class CreateGroups < ActiveRecord::Migration
  def up
    create_table :groups, :id => false do |t|

      t.string  :id, :null => false
      t.string  :name, :null => false
      t.string  :parent
      t.string  :environment
      t.boolean :environment_trumps
      t.text    :classes
      t.text    :rule
      t.text    :variables
    end

    execute 'ALTER TABLE groups ADD PRIMARY KEY (id)'
  end

  def down
    drop_table :groups
  end
end
