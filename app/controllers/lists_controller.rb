class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def show; end

  def new
    @influencer = Influencer.find(params[:influencer_id])
    @list = List.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list }
    end
  end

  def edit; end

  def create
    @influencer = Influencer.find(params[:influencer_id])
    @list = @influencer.lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to [@influencer, @list], notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to [@influencer, @list], notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to influencer_path(@influencer), notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_list
    @influencer = Influencer.find(params[:influencer_id])
    @list = @influencer.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:body)
  end
end
