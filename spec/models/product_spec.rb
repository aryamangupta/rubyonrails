require 'rails_helper'

describe Product do
  describe "Associations" do
    it { should belong_to :company }
    it { should belong_to :category }

    it { should have_many :pictures }
  end
end
