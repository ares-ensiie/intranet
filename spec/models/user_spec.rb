require 'spec_helper'

describe User do
  it { should belong_to(:promotion) }

  it { should validate_presence_of :username}
  it { should validate_presence_of :email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name}
  it { should validate_presence_of :promotion }

  it { should validate_uniqueness_of :username }

  it { should validate_inclusion_of(:gender).to_allow(%w(M F)) }
end
