class ItemsController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
 #before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    if params[:search]
      @items = Item.search(params[:search]).order(params[:sort] + " " + params[:direction]).paginate(page: params[:page], per_page: 5)
    elsif (params[:sort] && params[:direction])
      @items = Item.order(params[:sort] + " " + params[:direction]).paginate(page: params[:page], per_page: 5)
    else
      @items = Item.paginate(page: params[:page], per_page: 5)
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item.user_id = current_user.id
    respond_to do |format|
      if @item.save
        format.html { redirect_to root_url, notice: 'Item was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_item
    #  @item = Item.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :price, :user_id, :image)
    end
end