class Front::FrontController < ApplicationController
  layout 'front'

  private
    def after_sign_in_path_for(resource)
      if current_user && current_user.sign_in_count == 1
        redirect_to users_path(current_user)
      else
        redirect_to search_path
      end
    end
end