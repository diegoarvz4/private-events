class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :description
      t.datetime :date

      t.timestamps
    end
  end
end
