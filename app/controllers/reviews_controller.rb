class ReviewsController < ApplicationController
  def index

  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      respond_to do |format|
        format.html { redirect_to product_path(@review.product) }
        format.js
      end
    else
      render :new
    end
  end

  def destroy
    @review = Review.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to product_path(@review.product) }
      puts "here"
      format.js
    end
  end

  private
    def review_params
      params.require(:review).permit(:author, :content, :rating, :product_id)
    end
end
