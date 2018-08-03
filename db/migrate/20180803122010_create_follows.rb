class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.references :user, forgein_key: true
      t.references :comic, forgein_key: true

      t.timestamps
    end
  end
end
