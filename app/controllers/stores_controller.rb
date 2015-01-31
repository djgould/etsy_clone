class StoresController < ApplicationController
  def index
		@stores = Store.all
  end

  def show
		@store = Store.find(params[:id])
  end

  def new
		@store = Store.new
  end

  def create
		@store = current_user.stores.build(store_params)
		
		if @store.save
			redirect_to @store
		else
			flash[:alert] = "Please fix errors"
			render 'new'
		end
  end

  def edit
		@store = Store.find(params[:id])
  end

  def update
		@store = Store.find(params[:id])
		
		if @store.update_attributes(store_params)
			redirect_to @store
		else
			flash[:alert] = "Please fix errors"
			render 'edit'
		end
  end

  def destroy
		@store = Store.find(params[:id])
		if @store.delete
			redirect_to stores_path
		else
			flash[:alert] = "Store could not be deleted"
			redirect_to stores_path
		end
  end
	
	private
	
	def store_params
		params.require(:store).permit(:name, :description)
	end
end
