class CreateCurhats < ActiveRecord::Migration[7.0]
  def change
    create_table :curhats do |t|
      t.string :tema
      t.text :description

      t.timestamps
    end
  end
end
