# encoding: utf-8

# coding: utf-8

FactoryGirl.define do
  
  factory :message1, :class => Message do
    content "感動した"
    notice_date DateTime.new(1993, 2, 24, 12, 30, 45)
    noticed false
  end

  factory :message2, :class => Message do
    content "失敗した"
    notice_date DateTime.new(1993, 2, 24, 12, 30, 45)
    noticed true
  end

    factory :message3, :class => Message do
    content "失敗した"
    notice_date DateTime.new(2100, 2, 24, 12, 30, 45)
    noticed false
  end
end
