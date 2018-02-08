class InfluencersController < ApplicationController
  before_action :set_influencer, only: %i[show edit update destroy]

  def index
    @influencers = Influencer.order('RANDOM()').limit(15)
  end

  def show; end

  def new
    @influencer = Influencer.new
  end

  def edit; end

  def create
    @influencer = Influencer.new(influencer_params)

    respond_to do |format|
      if @influencer.save
        format.html { redirect_to @influencer, notice: 'Influencer was successfully created.' }
        format.json { render :show, status: :created, location: @influencer }
      else
        format.html { render :new }
        format.json { render json: @influencer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @influencer.update(influencer_params)
        format.html { redirect_to @influencer, notice: 'Influencer was successfully updated.' }
        format.json { render :show, status: :ok, location: @influencer }
      else
        format.html { render :edit }
        format.json { render json: @influencer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @influencer.destroy
    respond_to do |format|
      format.html { redirect_to influencers_url, notice: 'Influencer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_influencer
    @influencer = Influencer.find(params[:id])
    @lists = List.where influencer_id: @influencer.id
  end

  def influencer_params
    params.require(:influencer).permit(:name, :image, :bio)
  end
end
