class BigIntForHeroku < ActiveRecord::Migration
  def up
  	change_column :cs_integers, :id, :bigint if Rails.env.production?
  end

  def down
  end
end
