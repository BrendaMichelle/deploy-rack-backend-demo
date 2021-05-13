class CreateCars < ActiveRecord::Migration[5.2]
  def change

    create_table :cars do |t|
      t.string :company
      t.string :make
    end
    
  end
end
