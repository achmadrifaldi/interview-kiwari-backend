# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Products API' do
  path '/products' do
    get 'Retrieves products' do
      tags 'Products'
      produces 'application/json'

      response '200', 'Success' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 price: { type: :integer },
                 image: { type: :string }
               },
               required: %w[id name price image]

        let(:id) do
          Product.create(
            name: 'Product Sample',
            price: 1_000_000,
            image: 'https://via.placeholder.com/150'
          )
            .id
        end
        run_test!
      end
    end

    post 'Creates a product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :product,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    price: { type: :integer },
                    image: { type: :string }
                  },
                  required: %w[name price image]
                }

      response '200', 'Success' do
        let(:product) do
          {
            name: 'Product Name',
            price: 1_000_000,
            image: 'https://via.placeholder.com/150'
          }
        end
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:product) { { name: 'Product Name' } }
        run_test!
      end
    end
  end

  path '/products/{id}' do
    parameter name: :id, in: :path, type: :string

    get 'Retrieves a product' do
      tags 'Products'
      produces 'application/json'

      response '200', 'product found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 price: { type: :integer },
                 image: { type: :string }
               },
               required: %w[id name price image]

        let(:id) do
          Product.create(
            name: 'Product Sample',
            price: 1_000_000,
            image: 'https://via.placeholder.com/150'
          )
            .id
        end
        run_test!
      end

      response '404', 'product not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
    
    put 'Update a product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :product,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    price: { type: :integer },
                    image: { type: :string }
                  },
                  required: %w[name price image]
                }

      response '200', 'Success' do
        let(:product) do
          {
            name: 'Product Name',
            price: 1_000_000,
            image: 'https://via.placeholder.com/150'
          }
        end
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:product) { { name: 'Product Name' } }
        run_test!
      end

      response '404', 'Not Found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete 'Delete a product' do
      tags 'Products'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Success' do
        run_test!
      end

      response '404', 'product not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
