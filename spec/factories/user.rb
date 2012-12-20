FactoryGirl.define do
  factory :user do
    sequence(:username) { |i| "user#{i}" }
    sequence(:email) { |i| "user#{i}@ares-ensiie.eu" }
    first_name 'Paul'
    last_name 'Chobert'
    password 'abcd123'
    promotion

    trait :admin do
      is_admin true
    end
  end
end
