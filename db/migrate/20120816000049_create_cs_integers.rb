class CreateCsIntegers < ActiveRecord::Migration
  def change
    create_table :cs_integers do |t|
      t.string :celebrity_name
      t.string :celebrity_screen_name
      t.string :origin
      t.string :origin_url

      t.column :id, :bigint
      t.timestamps
    end
  end
end
