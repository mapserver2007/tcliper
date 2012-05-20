class CreateClips < ActiveRecord::Migration
  def self.up
    options = {
      :options => "ENGINE=MyISAM DEFAULT CHARSET=utf8"
    }
    create_table :clips do |t|
      t.column :id, :primary_key
      t.column :user_id, :integer
      t.column :title, :string
      t.column :url, :text
      t.column :url_hash, :string
      t.column :comment, :text
      t.column :date, :datetime
      t.column :public, :boolean, :default => 0
    end
    add_index :clips, :url_hash, :unique => true, :name => 'url_hash_index'
  end

  def self.down
    drop_table :clips
  end
end
