# encoding: utf-8

# coding: utf-8

class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  def notice
    @messages = Message.unsent_search   

    tweet
    
    respond_to do |format|
      format.html { render action: "index" }
    end
  end

  def pull
    tweet_pull
    respond_to do |format|
      format.html { render action: "index" }
    end
  end

  private

  def tweet

    @messages.each do |message|

      Twitter.configure do |config|
        config.consumer_key = 'galtGPSTwyL8gvnMJlzbg'
        config.consumer_secret = 'osmPS76ML9mkLut5O2Ybz6q9QigvAOOZYSZzNGyN4'
        config.oauth_token = message.user.access_token
        config.oauth_token_secret = message.user.access_secret
      end

      content = message.created_at.strftime("%Y年%m月%d日 %H:%M:%S")
      content << "\r\n"
      content << "タイムカプセルを掘り起こす時が来ました。"
      content << "\r\n"
      content << url_for( message_url(message.id) )
      Twitter.direct_message_create( message.user.name, content )

      message.noticed = true
      message.save

    end

  end

  def tweet_pull

    # Twitter.configure do |config|
    #   config.consumer_key = 'galtGPSTwyL8gvnMJlzbg'
    #   config.consumer_secret = 'osmPS76ML9mkLut5O2Ybz6q9QigvAOOZYSZzNGyN4'
    #   config.oauth_token = '1518978194-olqwtfG285noLBpq60Vp4S3AhD2CFkJ6fQ1Y3Ow'
    #   config.oauth_token_secret = 'TlvxDGu1FuVvJiiGuw0JYdyA6NAwK24WUgs7A7zrSo'
    # end

    twitter_setup = lambda { |user|
      Twitter.configure do |config|
        config.consumer_key = 'galtGPSTwyL8gvnMJlzbg'
        config.consumer_secret = 'osmPS76ML9mkLut5O2Ybz6q9QigvAOOZYSZzNGyN4'
        config.oauth_token = user.access_token
        config.oauth_token_secret = user.access_secret
      end
    }

    users = User.all
    users.each do |user|

      twitter_setup.call(user)
      maxTweet_id = Message.maxTweet_id(user.id)
 
      options = {"since_id" => maxTweet_id.to_s, "include_entities" => true}
      Rails.logger.info( options.inspect )
      Rails.logger.info( user.id.inspect )
      Rails.logger.info( user.name.inspect )
      Twitter.user_timeline( user.name, options ).each do |res|
        Rails.logger.info( res.id.inspect )
        if res.text =~ /#lifeplus24/ then
          Rails.logger.info( 'タイムカプセルを登録' )
          Message.create( :user_id => user.id, :tweet_id => res.id, :content => res.text, :notice_date => DateTime.now, :noticed => false )
        end
      end
    end

    @messages = Message.all

  end

end
