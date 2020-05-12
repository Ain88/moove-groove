class RecordsController < ApplicationController
before_action :set_record, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

  def show
  end

  def index
    @records = current_user.records
  end

  def new
    @record = Record.new
    @activities = Activity.all
  end

  def create
    @record = Record.new(record_params)
    @record.user = current_user
    @record.total_calories = @record.activity.calories * @record.duration/15 * @record.user.weight/60
    if @record.save
      flash[:notice] = "Record was created successfully"
      redirect_to (@record)
    else
      render 'new'
    end
  end

  def edit
    @activities = Activity.all
    if @record.user != current_user
      redirect_to records_path
    end
  end

  def update
    @record.update(record_params)
    @record.total_calories = @record.activity.calories * @record.duration/15 * @record.user.weight/60
    if @record.update(record_params)
      flash[:notice] = "Record was updated successfully"
      redirect_to (@record)
    else
      render 'edit'
    end
  end

  def destroy
    @record.destroy
    flash[:notice] = "Selected record was deleted"
    redirect_to records_path
  end

  def set_calories
    @record.total_calories = @record.activity.calories * @record.duration/15 * @record.user.weight/60
  end

  private

  def record_params
    params.require(:record).permit(:activity_id, :activity_date, :duration)
  end

  def set_record
      @record = Record.find(params[:id])
  end

end
