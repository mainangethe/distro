class ListsController < ApplicationController
  before_action :set_entity
  before_action :set_campaign
  before_action :set_list, only: %w[show edit update destroy]

  def new
    @list = @campaign.lists.new
  end

  def show; end

  def create
    @list = @campaign.lists.new(list_params)

    if @list.save
      redirect_to entity_campaign_path(@entity, @campaign), notice: "List - #{@list.name} created successfully"
    else
      flash[:alert] = 'Unable to create list'
      render :new
    end
  end

  def edit; end

  def update
    if @list.update
      redirect_to entity_campaign_list_path(@entity, @campaign, @list), notice: "List - #{@list.name} updated successfully"
    else
      render :edit
    end
  end

  def destroy
    if @list.destroy
      redirect_to entity_campaign_path(@entity, @campaign), notice: "List - #{@list.name} deleted"
    end
  end

  private

    def set_entity
      @entity = Entity.find(params[:entity_id])
    end

    def set_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params
        .require(:list)
        .permit(:name, :list_type, :status, :campaign_id)
    end
end
