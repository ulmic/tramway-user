class CreateTramwayUserUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_user_users do |t|

      t.timestamps
    end
  end
end
