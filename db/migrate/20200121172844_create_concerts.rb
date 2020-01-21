class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
      t.string :displayName
      t.string :location
      t.datetime :date
    end
  end
end
