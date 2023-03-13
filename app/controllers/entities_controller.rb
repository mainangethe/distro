class EntitiesController < ApplicationController
  before_action :set_entity, only: %w[show edit update destroy]

  def index; end
  def show; end

  def new
    @entity = Entity.new
  end

  def create
    @entity = current_user.entities.new(entity_params)

    if @entity.save
      redirect_to @entity, notice: "Entity - #{@entity.name} saved successfully."
    else
      flash[:alert] = 'System was unable to save the entity.'
      render :new
    end
  end

  def edit; end
  def update
  end

  private

    def entity_params
      params
        .require(:entity)
        .permit(:name, :entity_type, :email, :logo, :status)
    end

    def set_entity
      @entity = Entity.find(params[:id])
    end
end

