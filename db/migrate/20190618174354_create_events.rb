class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.references :user

      t.timestamps
    end
  end
end
