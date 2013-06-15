# encoding: utf-8

# coding: utf-8

require 'spec_helper'

describe Message do

  context "unsent_search" do
    before do
      Message.delete_all
      @message1 = create(:message1)
      @message2 = create(:message2)
      @message3 = create(:message3)
    end

    it "検索結果件数が正しいこと" do
    	  Message.unsent_search.size.should eq 1
    end

    it "検索内容が正しいこと" do
    	  Message.unsent_search.first.content.should eq '感動した'
    end
  end

  context "maxTweet_id" do
    before do
      Message.delete_all
      @message1 = create(:message1, :user_id => 1, :tweet_id => 5)
      @message2 = create(:message2, :user_id => 1, :tweet_id => 10)
      @message3 = create(:message3, :user_id => 2, :tweet_id => 100)
    end

    it "最大Tweet_idが正しいこと" do
        Message.maxTweet_id(1).should eq 10
    end
  end


end
