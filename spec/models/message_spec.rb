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
end
