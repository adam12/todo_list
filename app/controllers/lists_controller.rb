class ListsController < ApplicationController
  # GET /lists
  def index
    list = List.first_or_create

    redirect_to list_path(list) # /lists/1
  end

  # GET /lists/:id
  # /lists/4
  def show
    @list = List.find(params[:id]) # FInd list id 1
  end

  # PATCH /lists/:id
  def update
    @list = List.find(params[:id])
    @list.update(list_params)

    respond_to do |format|
      format.html do
        redirect_to list_path(@list)
      end

      format.js # update.js.erb
    end
  end

  private

  def list_params
    params[:list].permit(tasks_attributes: [:id, :title, :completed])
  end
end
