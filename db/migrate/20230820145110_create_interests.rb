class CreateInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :interests do |t|
      t.string :name, null: false, index: true

      t.timestamps
    end
  end
end
