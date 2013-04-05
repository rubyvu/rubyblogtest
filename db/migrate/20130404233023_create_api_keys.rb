class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.belongs_to :user
      t.string :access_token

      t.timestamps
    end
    add_index :api_keys, :user_id
  end
end
