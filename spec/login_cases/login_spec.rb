require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe "create a user" do
    let!(:params) {
      {
          user: {
              first_name: 'Shady',
              last_name: "Sanyasi",
              gender: "male",
              dob: Time.now,
              designation: "Engineer",
              company: "Selise",
              address: "Thimphu",
              email: "prakashsanyasi619@gmail.com",
              password: "nopassword",
              passwordconfirmation: "nopassword",
              admin: true
          }
      }
    }
    it "valid params" do
      binding.pry
      post users_path, params: params
      binding.pry
      expect(status).to eq(200)
    end
  end
end