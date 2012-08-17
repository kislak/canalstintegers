class BigIntForHeroku < ActiveRecord::Migration
  def up
  	change_column :cs_integers, :id, :bigint
  end

  def down
  end
end
