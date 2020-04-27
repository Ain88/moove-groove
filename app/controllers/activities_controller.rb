class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
  end

  def index
    # @activities = current_user.activities
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash[:notice] = "Activity was created successfully"
      redirect_to (@activity)
    else
      render 'new'
    end
  end

  def activity_params
    params.require(:activity).permit(:name, :calories, :description)
  end
end
