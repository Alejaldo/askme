class AddApiTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.text :api_token, null: true, index: { unique: true }
    end
  end
end
