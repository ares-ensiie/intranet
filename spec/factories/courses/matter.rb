FactoryGirl.define do
  factory :matter do
    sequence(:name) { |i| "matter#{i}" }
    year "1A"

    trait :with_documents do
      ignore do
        documents_number 5
      end

      after :create do |matter, evaluator|
        FactoryGirl.create_list :document, evaluator.documents_number, matter: matter
      end
    end
  end
end

