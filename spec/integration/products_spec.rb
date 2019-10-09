# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Products API' do
  path '/products' do
    get 'Retrieves products' do
			tags 'Products'
			produces 'application/json'

			response '200', 'Product Found' do
				schema type: :object,
					properties: {
						id: { type: :integer, },
						name: { type: :string },
						price: { type: :integer },
						image: { type: :string }
					},
					required: [ 'id', 'name', 'price', 'image' ]

				let(:id) { Product.create(name: 'Product Sample', price: 1000000, image: 'https://via.placeholder.com/150').id }
				run_test!
			end
		end

    post 'Creates a product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          price: { type: :integer },
          image: { type: :string }
        },
        required: [ 'name', 'price', 'image' ]
      }

      response '200', 'Product Created' do
        let(:product) { { name: 'Product Name', price: 1000000, image: 'https://via.placeholder.com/150' } }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:product) { { name: 'Product Name' } }
        run_test!
      end
    end
  end

  path '/products/{id}' do

    get 'Retrieves a product' do
      tags 'Products'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'product found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            price: { type: :integer },
            image: { type: :string }
          },
          required: [ 'id', 'name', 'price', 'image' ]

        let(:id) { Product.create(name: 'Product Sample', price: 1000000, image: 'https://via.placeholder.com/150').id }
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
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          price: { type: :integer },
          image: { type: :string }
        },
        required: [ 'name', 'price', 'image' ]
      }

      response '200', 'Product Updated' do
        let(:product) { { name: 'Product Name', price: 1000000, image: 'https://via.placeholder.com/150' } }
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
        parameter name: :id, :in => :path, :type => :string
  
        response '200', 'Product Deleted' do
          run_test!
        end
  
        response '404', 'product not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
  end
end