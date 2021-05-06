require 'rails_helper'

RSpec.describe Challenge, type: :model do
    current_employee = Employee.first_or_create(id: 1, emp_id: "E01", email: "abc@gmail.com", password: "password", password_confirmation: "password")
    
    it 'belongs to employee' do
        expect(described_class.reflect_on_association(:employee).macro).to eq(:belongs_to)
    end
    
    it 'has many collaborators' do
    expect(described_class.reflect_on_association(:collaborate).macro).to eq(:has_many)
    end
    
    it 'has many upvotes' do
    expect(described_class.reflect_on_association(:upvote).macro).to eq(:has_many)
    end

    it "is not valid without a title" do
    challenge = Challenge.new(title: nil)
    expect(challenge).to_not be_valid
    end

    it "is not valid without a description" do
    challenge = Challenge.new(description: nil)
    expect(challenge).to_not be_valid
    end

    it "is not valid without tags" do
    challenge = Challenge.new(tags: nil)
    expect(challenge).to_not be_valid
    end

    it "is not valid without creater id" do
        challenge = Challenge.new(created_by: nil)
        expect(challenge).to_not be_valid
    end

    it "is valid with valid entries" do
        challenge = Challenge.new(
            title: 'Title',
            description: 'Description',
            tags: 'Tag',
            employee_id: current_employee.id,
            created_by: current_employee.emp_id
        )
        expect(challenge).to be_valid
    end

end