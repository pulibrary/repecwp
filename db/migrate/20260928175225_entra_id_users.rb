class EntraIdUsers < ActiveRecord::Migration[8.1]
  DEVISE_COLUMNS = [
    :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,
    :sign_in_count, :current_sign_in_ip, :last_sign_in_ip, :username
  ]
  def up
    DEVISE_COLUMNS.each { |column| remove_column :users, column }
    execute "UPDATE users SET provider='entra_id'"
  end

  def down
    execute "UPDATE users SET provider='cas'"
  end
end
