class Message < ActiveRecord::Base
  attr_accessible :content, :notice_date, :noticed
end
