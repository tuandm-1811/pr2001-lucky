class CreateRating < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :sum_rating
    end
  end
end
