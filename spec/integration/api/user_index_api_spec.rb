require 'swagger_helper'

describe 'Users API' do
  path '/api/users' do
    get 'Get all users' do
      tags 'Users'
      produces 'application/json'
      response '200', 'users found' do
        schema type: :array, items: { '$ref' => '#/components/schemas/User' }
        run_test!
      end
    end
  end

  path '/api/users/{id}' do
    get 'Get user by id' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'user found' do
        schema '$ref' => '#/components/schemas/User'
        run_test!
      end
    end
  end
end
