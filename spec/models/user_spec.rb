# encoding: utf-8

# coding: utf-8

require 'spec_helper'

describe User do

  describe "name" do
    context "UserがProfileを持つ場合" do
      before do
                     User.delete_all
       Profile.delete_all

        @user = create(:user1)
        @user.profile = create(:luida_tarou, :user => @user)
      end

      subject { @user.name }

      it { should eq @user.profile.last_name + @user.profile.first_name }
    end

    context "UserがProfileを持たない場合" do
      before do
              User.delete_all
       Profile.delete_all

        @user = create(:user1)
      end

      subject { @user.name }

      it { should eq USER_NAME_WHEN_NOT_FOUND }
    end
  end

  # describe "search" do
  #   before do
  #     User.delete_all
  #     Profile.delete_all

  #     @user1 = create(:user1)
  #     # @user2 = create(:user2)
  #     @profile1 = create(:luida_tarou,   :user => @user1)
  #     # @profile2 = create(:luida_saburou, :user => @user2)
  #   end

  #   it "検索結果件数が正しいこと" do
  #     Profile.search.size.should == 2
  #   end

  # end


end
