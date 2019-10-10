# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Products API' do
  path '/products' do
    get 'Get All Product' do
      tags 'Products'
      produces 'application/json'

      response '200', 'Success' do
        let!(:products) { create_list(:product, 10) }
        run_test!
      end
    end

    post 'Insert New Product' do
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
        pending "Unprocessable Entity #{__FILE__}"
      end
    end
  end

  path '/products/{id}' do
    parameter name: :id, in: :path, type: :string

    let(:id) do
      Product.create(
        name: 'Product Sample',
        price: 1_000_000,
        image: 'https://via.placeholder.com/150'
      )
        .id
    end

    get 'Get Product by ID' do
      tags 'Products'
      produces 'application/json'

      response '200', 'Success' do
        run_test!
      end

      response '404', 'Not Found' do
        pending "Not Found #{__FILE__}"
      end
    end
    
    put 'Update Product by ID' do
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
        pending "Unprocessable Entity #{__FILE__}"
      end

      response '404', 'Not Found' do
        pending "Not Found #{__FILE__}"
      end
    end

    delete 'Delete Product by ID' do
      tags 'Products'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Success' do
        run_test!
      end

      response '404', 'Not Found' do
        pending "Not Found #{__FILE__}"
      end
    end
  end
end
