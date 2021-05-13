class CreateLeases < ActiveRecord::Migration[5.2]
  def change

    create_table :leases do |t|
      t.integer :year
      t.integer :car_id
      t.integer :toy_id
    end

  end
end
