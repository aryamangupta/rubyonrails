require 'rails_helper'

RSpec.describe Company, :type => :model do
  describe 'Associations' do
    it { should have_many :users }
    it { should have_many :products }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :business_type }
  end
end
