class CreateCategroys < ActiveRecord::Migration[6.0]
  def change
    create_table :categorys do |t|
      t.string :title

      t.timestamps
    end
  end
end
