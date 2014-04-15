require 'spec_helper'

describe User do

  it { should have_many :tweets }
  it { should have_many :follows }

  it { should validate_presence_of :handle }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password_digest }

end
