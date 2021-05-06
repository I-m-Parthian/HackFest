require 'rails_helper'

RSpec.describe Upvote, type: :model do
  it 'belongs to challenge' do
    expect(described_class.reflect_on_association(:challenge).macro).to eq(:belongs_to)
  end

  it 'belongs to user' do
    expect(described_class.reflect_on_association(:employee).macro).to eq(:belongs_to)
  end
end