FactoryGirl.define do
  factory :oauth_application, class: 'Oauth::Application' do
    name 'my application'
    redirect_uri 'http://app.net/'
    association :owner, factory: :user
  end
end

