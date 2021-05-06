require 'rails_helper'

RSpec.describe Collaborate, type: :model do
  it 'belongs to challenge' do
    expect(described_class.reflect_on_association(:challenge).macro).to eq(:belongs_to)
  end

  it 'belongs to employee' do
    expect(described_class.reflect_on_association(:employee).macro).to eq(:belongs_to)
  end
end