require 'rails_helper'
require "rspec/json_expectations"

RSpec.describe "Users", type: :request do
    describe "Testing V1 Request/Controllers with Authentication" do
        before do 
            @user = create(:user)

            post "/v1/users/tokens/sign_in", params: { "email" => @user.email, "password" => @user.password }, headers: { "content" => "application/json" }
            auth = JSON.parse response.body

            @headers = {"ACCPET" => "application/json", "AUTHORIZATION" => "Bearer #{auth["token"]}"}
        end

        it "SHOW 201 OK" do
            get "/v1/users/#{@user.id}.json", headers: @headers
      
            expect(response).to have_http_status(200)
            expect(response.body).to include_json(
                "id" => /\d/,
                "name" => (be_a_kind_of String),
                "email" => (be_a_kind_of String)
            )
        end

        it "UPDATE 200 Updated" do      
            headers = {"ACCPET" => "application/json"}
            @user.name += " - UPDATE"
      
            put "/v1/users/#{@user.id}.json",  params: {user: @user.attributes}, headers: @headers
      
            expect(response).to have_http_status(200)
            expect(response.body).to include_json(
                "id" => /\d/,
                "name" => (be_a_kind_of String),
                "email" => (be_a_kind_of String)
            )
        end
    end
end