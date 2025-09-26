# Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
class ApplicationController < ActionController::Base
  include ActionView::Helpers::NumberHelper

  allow_browser versions: :modern

  before_action :products
  helper_method :products, :generate_random_stats

  private

  def products
    @products ||= Product.all
    # render featured/unfeatured products conditionally
    @unfeatured_products = @products.where(is_featured: false)
    @featured_products = @products.where(is_featured: true)
  end
end
