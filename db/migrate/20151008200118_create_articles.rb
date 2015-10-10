class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
