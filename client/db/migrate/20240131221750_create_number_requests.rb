class CreateNumberRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :number_requests do |t|
      t.string :input
      t.text :response

      t.timestamps
    end
  end
end
