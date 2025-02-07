class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  def after_sign_in_path_for(resource)
    my_page_index_path
  end
end
