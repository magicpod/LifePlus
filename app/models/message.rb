class Message < ActiveRecord::Base
  attr_accessible :content, :notice_date, :noticed, :user_id
  belongs_to :user
end
