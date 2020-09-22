class Users < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t| 
      t.string :username
      t.string :password_digest 
    end 
  end
  
  def down 
<<<<<<< HEAD
    drop_table :users
=======
    :users.delete 
>>>>>>> 998cb1e2fa5fac9ab24bd26cd1b33f319bec9f22
  end 
end
