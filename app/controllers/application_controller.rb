# Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :load_all
  helper_method :products, :brands

  private

  def load_all
    products
    brands
  end

  def products
    @products ||= Product.all
    # render featured/unfeatured products conditionally
    @unfeatured_products = @products.where(is_featured: false)
    @featured_products = @products.where(is_featured: true)
  end

  def brands
    @brands ||= Brand.all
  end
end
