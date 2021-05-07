require 'rails_helper'

RSpec.describe "Challenges", type: :request do
    
    current_employee = Employee.first_or_create!(id: 1, emp_id: 'E08', email: 'abc@gmail.com', password: 'password',password_confirmation: 'password')
    # challenge1 = Challenge.first_or_create(id: 9, title: "Title", description: "abc", tags: "Tag", employee_id: 1, created_by: "E01", votes: 0)
    let(:valid_attributes) do
        {
        'title' => 'Valid title',
        'description' => 'valid description',
        'tags' => 'tag',
        employee_id: current_employee.id,
        created_by: current_employee.emp_id
        }
    end

    let(:invalid_attributes) do
        {
        'title' => '',
        'description' => '',
        'tags' => '',
        employee_id: current_employee.id,
        created_by: current_employee.emp_id
        }
    end
  

    describe "GET/index" do
        it "renders all successful response" do
          sign_in current_employee
          Challenge.create(valid_attributes)
          get new_challenge_path
          expect(response).to be_successful
        end
      end
    
    describe "GET/index" do
        it "renders a successful response" do
            sign_in current_employee
            challenge = Challenge.create(valid_attributes)
            get new_challenge_path(challenge)
            expect(response).to be_successful
        end
    end

    describe "POST/create" do
        it "creates a new challenge" do
          sign_in current_employee
          expect do
          post challenges_path, params: {challenge: valid_attributes}
          end.to change(Challenge, :count).by(1)
          expect(response).to have_http_status(:found)
        end
    end

    # describe "GET/index" do
    #     it "renders all successful response" do
    #     sign_in current_employee
    #     Upvote.create({employee_id: current_employee.id, challenge_id: challenge1.id })
    #     expect(response).to be_successful
    #     end
    # end
end