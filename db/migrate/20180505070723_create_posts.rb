class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :date
      t.string :result1
      t.string :result2
      t.string :result3
      t.string :result4
      t.string :result5
      t.text :content
      
      t.integer :view_count,  default: 0
      
      #user 
      t.belongs_to  :user

      t.timestamps null: false
    end
  end
end
