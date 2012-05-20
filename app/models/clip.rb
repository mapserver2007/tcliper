class Clip < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :message => "authorization failed"
  validates_presence_of :title, :url, :url_hash, :comment, :date
  validates_uniqueness_of :url_hash, :message => "already clip this site!"
end
