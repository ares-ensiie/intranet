require 'spec_helper'
require 'rack/test'

describe Api::V1 do
  let(:application) { FactoryGirl.create :oauth_application }
  let(:api_host) { "http://api.ares-ensiie.eu" }

  describe 'matter resource' do
    # GET /courses/
    describe 'get all matters' do 
      binding.pry
      let(:matters) { FactoryGirl.build_list :matter, 10, :with_documents }
      let!(:request) { get "#{api_host}/courses?client_id=#{application.uid}&client_secret=#{application.secret}" }

      subject { last_response }

      its(:status) { should be 200 }
      its(:body) { should have_json_path '0/name' }
      its(:body) { should have_json_path '0/year' }
      its(:body) { should have_json_path '0/documents/0/id' }
      its(:body) { should have_json_path '0/documents/0/name' }
      its(:body) { should have_json_path '0/documents/0/file' }
      its(:body) { should have_json_path '0/documents/0/type' }
      its(:body) { should have_json_path '0/documents/0/release_date' }
      its(:body) { should have_json_path '0/documents/0/author_id' }
    end

    # GET /courses/:matter_id
    describe 'get one matter' do
      let(:matter) { FactoryGirl.build_list :matter, :with_documents }
      let!(:request) { get "#{api_host}/courses?client_id=#{application.uid}&client_secret=#{application.secret}" }

      subject { last_response }

      its(:status) { should be 200 }
      its(:body) { should have_json_path 'name' }
      its(:body) { should have_json_path 'year' }
      its(:body) { should have_json_path 'documents/0/id' }
      its(:body) { should have_json_path 'documents/0/name' }
      its(:body) { should have_json_path 'documents/0/file' }
      its(:body) { should have_json_path 'documents/0/type' }
      its(:body) { should have_json_path 'documents/0/release_date' }
      its(:body) { should have_json_path 'documents/0/author_id' }
    end
  end
end

