class HomeController < ApplicationController
  before_action :set_entity

  def index
  end

  private

    def set_entity
      @entity = current_user.entities.active_status.first
    end
end
