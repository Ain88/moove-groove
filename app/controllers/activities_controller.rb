class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
  end

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    if current_user.admin != true
      redirect_to activities_path
    end
    @activity = Activity.new(activity_params)
    if @activity.save
      flash[:notice] = "Activity was created successfully"
      redirect_to (@activity)
    else
      render 'new'
    end
  end

  def edit
    if current_user.admin != true
      redirect_to activities_path
    end
  end

  def update
    if current_user.admin != true
      redirect_to activities_path
    end
    if @activity.update(activity_params)
      flash[:notice] = "Activity was updated successfully"
      redirect_to (@activity)
    else
      render 'edit'
    end
  end

  def destroy
    Record.where(:activity_id => :id).destroy_all
    @activity.destroy
    "Selected activity was deleted"
    redirect_to activities_path
  end

  def activity_params
    params.require(:activity).permit(:name, :calories, :description)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

end
