class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
    @products = Product.all
    json_response(@products.as_json(except: %i[created_at updated_at]))
  end

  # GET /products/1
  def show
    json_response(@product.as_json(except: %i[created_at updated_at]))
  end

  # POST /products
  def create
    @product = Product.create(product_params)
    json_response(@product.as_json(except: %i[created_at updated_at]))
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      json_response(@product.as_json(except: %i[created_at updated_at]))
    else
      raise ActiveRecord::RecordInvalid.new(@product)
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    json_response([])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def product_params
    params.fetch(:product, {}).permit(:name, :price, :image)
  end
end
