require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'has many challenges' do
    expect(described_class.reflect_on_association(:challenge).macro).to eq(:has_many)
  end

  it 'has many upvotes' do
    expect(described_class.reflect_on_association(:upvote).macro).to eq(:has_many)
  end

  it 'has many collaborators' do
    expect(described_class.reflect_on_association(:collaborate).macro).to eq(:has_many)
  end

  it "validates emp_id" do
    subject.emp_id = 'E09'
    subject.validate 
    expect(subject.errors[:emp_id]).to_not include
  end

end