class AddMarkets < ActiveRecord::Migration
  def change
    create_table :market do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
