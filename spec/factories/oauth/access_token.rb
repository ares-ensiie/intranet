FactoryGirl.define do
  factory :access_token, class: 'Doorkeeper::AccessToken' do
    association :application, factory: :oauth_application
    resource_owner_id nil
    token { SecureRandom.method(:hex) }
    expires_in 7200
    revoked_at nil
  end
end
