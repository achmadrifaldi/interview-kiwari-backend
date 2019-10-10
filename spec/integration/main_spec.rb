# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Main API' do
  path '/' do
    get 'Retrieve App Info' do
      tags 'Root'
      produces 'application/json'

      response '200', 'Sucess' do
        run_test!
      end
    end
  end
end
