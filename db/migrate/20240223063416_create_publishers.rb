class CreatePublishers < ActiveRecord::Migration[7.1]
  def change
    create_table :publishers do |t|
      t.integer :user_id, comment: "Foreign Key"
      t.string :name, comment: "Publisher Name"
      t.string :card_no, comment: "Card Number"
      t.date :birthday, comment: "Birthday"
      t.timestamps
    end
  end
end
