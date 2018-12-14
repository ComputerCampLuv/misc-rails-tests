class ItemsController < ApplicationController
  def index
    @items = Item.all.page params[:page]
  end

  def show
    @item = Item.find params[:id]
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      redirect_to @item
    else
      redirect_to items_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.last_edited_by = current_user

    if @item.update(item_params)
      flash[:notice] = "Updated successfully!"
      redirect_to @item
    else
      flash[:alert] = "Failed to update!"
      render 'edit'
    end
  end

  def search
    @items = Item.search params[:search]
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, steps_attributes: [ :id, :content, :_destroy ])
  end


end
