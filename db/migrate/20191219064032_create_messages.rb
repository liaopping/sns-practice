class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :chatroom, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
