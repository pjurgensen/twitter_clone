require 'spec_helper'

describe User do

  it { should have_many :tweets }
  it { should have_many :follows }

  it { should validate_presence_of :handle }
  it { should validate_presence_of :email }
  it { should allow_value('example@example.org', 'another.example@example.org').for(:email)}
  it { should validate_uniqueness_of :email }
  it { should ensure_length_of(:password).is_at_least(6) }
  it { should validate_presence_of :password_digest }
  it { should validate_uniqueness_of :password_digest }

end
