class Message < ActiveRecord::Base
  attr_accessible :content, :notice_date, :noticed
  belongs_to :user
  
  scope :unsent_search, where('notice_date < ? and noticed = ?', DateTime.now , false)
  
end
