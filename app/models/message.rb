class Message < ActiveRecord::Base
  attr_accessible :content, :notice_date, :noticed, :user_id, :tweet_id
  belongs_to :user
  
  scope :unsent_search, where(:noticed =>false)


  def self.maxTweet_id (user_id)
  	message = Message.where(:user_id => user_id).order('tweet_id desc').first

  	return 1 unless message
  	message.tweet_id + 1
  end
  
end
