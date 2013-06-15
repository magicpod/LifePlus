# coding: utf-8

FactoryGirl.define do

  factory :user1, :class => User do
    account 'user1'
    email 'test01@gmail.com'
    encrypted_password 'user1!'
    password 'user1!'
    password_confirmation 'user1!'
    created_at DateTime.now
    updated_at DateTime.now
  end

  factory :user2, :class => User do
    account 'user2'
    email 'test02@gmail.com'
    encrypted_password 'user2!'
    password 'user2!'
    password_confirmation 'user2!'
    created_at DateTime.now
    updated_at DateTime.now
  end

end
