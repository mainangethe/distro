class ListDetailsController < ApplicationController
  before_action :set_entity
  before_action :set_campaign
  before_action :set_list
  before_action :set_list_detail, only: %w[show edit update destroy]

  def show; end

  def new
    @list = @list.list_details.new
  end

  def create
    @list_detail = @list.list_details.new(list_detail_params)

    if @list_detail.save
      redirect_to entity_campaign_path(@entity, @campaign, @list), notice: "#{@list_detail.name} created successfully"
    else
      flash[:alert] = 'Unable to add to list'
      render :new
    end
  end

  def edit; end

  def update
    if @list_detail.update
      redirect_to entity_campaign_list_path(@entity, @campaign, @list), notice: "#{@list_detail.name} updated successfully"
    else
      render :edit
    end
  end

  def destroy
    if @list_detail.destroy
      redirect_to entity_campaign_list_path(@entity, @campaign, @list), notice "#{@list_detail.name} deleted"
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
      @list = List.find(params[:list_id])
    end

    def set_list_detail
      @list_detail = ListDetail.find(params[:id])
    end

    def list_detail_params
      params
        .require(:list_detail)
        .permit(:first_name, :middle_name, :last_name, :gender, :identification_type, :identification_number, :phone_number, :email_address, :list_id)
    end

end

