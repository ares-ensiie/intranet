FactoryGirl.define do
  factory :promotion do
    sequence(:name) { |i| "promotion#{i}" }

    trait :with_students do
      ignore do
        students_count 10
      end
      after :create do |promotion, evaluator|
        FactoryGirl.create_list :user, evaluator.students_count, promotion: promotion
      end
    end
  end
end
