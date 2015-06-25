class CreateCommodities < ActiveRecord::Migration
  def change
    create_table :commodities do |t|
      t.string :title
      t.string :cover
      t.float :price
      t.string :summary

      t.timestamps null: false
    end
  end
end
