class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
  before_action :authenticate_user!
  
  private

    def after_sign_in_path_for(*)
      set_entity
    end

    def user_for_paper_trail
      user_signed_in? ? current_user.id : 'System'
    end

    def set_entity
      @entity = current_user.entities.active_status.first if user_signed_in?
    end
end
