class CreateUsers < ActiveRecord::Migration
  def self.up
    options = {
      :options => "ENGINE=MyISAM DEFAULT CHARSET=utf8"
    }
    create_table "users", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      t.column :apikey,                    :string
      t.column :provider,                  :string
    end

    add_index :users, :apikey, :unique => true, :name => 'apikey_index'
  end

  def self.down
    drop_table "users"
  end
end
