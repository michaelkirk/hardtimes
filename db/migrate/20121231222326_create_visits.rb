class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :visitor_name
      t.datetime :arrived_at
      t.datetime :left_at

      t.timestamps
    end

    add_index :visits, :visitor_name
  end
end
