class RecordsController < ApplicationController
before_action :set_record, only: [:show, :edit, :update, :destroy]

  def show

  end

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
    @activities = Activity.all
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      flash[:notice] = "Record was created successfully"
      redirect_to (@record)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @record.update(record_params)
      flash[:notice] = "Record was updated successfully"
      redirect_to (@record)
    else
      render 'edit'
    end
  end

  private

  def record_params
    params.require(:record).permit(:user_id, :activity_id, :activity_date,
      :duration, :total_calories)
  end

  def set_record
    @record = Record.find(params[:id])
  end

end
