require 'spec_helper'

describe Tweet do

  it { should belong_to :user }

  it { should validate_presence_of :message }

end
