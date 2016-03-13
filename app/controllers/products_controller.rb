class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end
  
  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'show.html.erb'
  end

  def create
    product = Product.create({name: params[:name], 
                              price: params[:price], 
                              brand: params[:brand], 
                              description: params[:description],
                              image: params[:image]})
    flash[:success] = "Product successfully created!"
    redirect_to "/products/#{product.id}"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'edit.html.erb'
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.update({name: params[:name], price: params[:price], brand: params[:brand], description: params[:description], image: params[:image]})
    flash[:success] = "Product successfully updated!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    flash[:warning] = "Product deleted!"
    redirect_to '/products'
  end
end
