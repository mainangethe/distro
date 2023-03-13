class CampaignsController < ApplicationController
  before_action :set_entity
  before_action :set_campaign, only: %w[show edit update delete]

  def index
    @campaigns = @entity.campaigns.active_status
  end

  def show
    @lists = @campaign.lists.active_status.limit(10)
  end

  def new
    @campaign = @entity.campaigns.new
  end

  def create
    @campaign = @entity.campaigns.new(campaign_params)

    if @campaign.save
      redirect_to entity_campaign_path(@entity, @campaign) , notice: "Campaign - #{@campaign.name} saved successfully."
    else
      flash[:alert] = 'Unable to save Campaign.'
      render :new
    end
  end

  def edit; end

  def update
    if @campaign.update
      redirect_to entity_campaign_path(@entity, @campaign), notice: "Campaign - #{@campaign.name} updated successfully."
    else
      flash[:alert] = 'Unable to update campaign.'
      render :edit
    end
  end

  def delete
    @campaign.destroy
    redirect_to entity_campaigns_url(@entity), notice: 'Campaign was deleted'
  end

  private

    def set_entity
      @entity = Entity.find(params[:entity_id])
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def campaign_params
      params
        .require(:campaign)
        .permit(:name, :campaign_type, :check_level, :status, :entity_id)
    end
end
