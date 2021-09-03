require 'rails_helper'
module Mutations
  RSpec.describe CreateAuthor, type: :request do
    describe 'resolve' do
      it 'creates author' do
        query = {
          query: <<~GQL
            mutation {
              createAuthor(input: {
              firstName: "jas",
              lastName: "singh"}){
                author {
                  id
                  firstName
                } errors
              }
            }
          GQL
       }
        expect do
          post '/graphql', params: query
        end.to change { Author.count }.by(1)
      end
    end
  end
end