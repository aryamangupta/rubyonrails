require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "Associations" do
    it { should belong_to :company }
  end
end
